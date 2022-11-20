import 'package:flutter/material.dart';
import 'package:user_logger/components/gender_item.dart';
import 'package:user_logger/models/gender.dart';

class GenderSelector extends StatefulWidget {
  GenderSelector({super.key});
  Gender _genValue = Gender.male;
  @override
  State<GenderSelector> createState() => _GenderSelectorState();
  Gender get getGenValue => _genValue;
  set setGen(Gender gen) {
    _genValue = gen;
  }
}

class _GenderSelectorState extends State<GenderSelector> {
  var _genIndex = 0;
  final _genders = [Gender.male, Gender.female, Gender.other];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(
          _genders.length,
          (int index) {
            return ChoiceChip(
              label: GenderAvatar(gen: _genders[index]),
              selected: _genIndex == index,
              elevation: 5,
              shadowColor: Colors.transparent,
              labelPadding: const EdgeInsets.all(10),
              selectedColor: const Color.fromARGB(44, 227, 223, 223),
              onSelected: (bool selected) {
                setState(() {
                  _genIndex = selected ? index : 0;
                  widget.setGen = _genders[_genIndex];
                });
              },
              backgroundColor: Colors.transparent,
            );
          },
        ),
      ),
    );
  }
}
