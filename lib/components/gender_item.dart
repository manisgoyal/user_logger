import 'package:flutter/material.dart';

import '../models/gender.dart';

class GenderAvatar extends StatelessWidget {
  final Gender gen;
  const GenderAvatar({Key? key, required this.gen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (gen != Gender.other)
        ? Icon(
            (gen == Gender.male) ? Icons.male_rounded : Icons.female_rounded,
            color: (gen == Gender.male) ? Colors.blue.shade900 : Colors.pink,
          )
        : ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [Colors.blue.shade900, Colors.pink],
              tileMode: TileMode.mirror,
            ).createShader(bounds),
            child: const Icon(
              Icons.transgender_rounded,
              color: Colors.white,
            ),
          );
  }
}
