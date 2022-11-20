import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:user_logger/models/logged_userinfo.dart';
import 'package:user_logger/routes/user_log_screen.dart';
import '../routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pathDir = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(pathDir.path);
  Hive.registerAdapter(LoggedUserAdapter());
  await Hive.openBox<LoggedUser>('loggedUser');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Tutorial',
      routes: {
        '/userLogged': (context) => const UserLogScreen(),
        '/userInfo': (context) => const UserInfoScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: Hive.openBox<LoggedUser>('loggedUser'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const UserLogScreen();
            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    Hive.box('contacts').compact();
    Hive.close();
    super.dispose();
  }
}
