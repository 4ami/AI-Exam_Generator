import 'package:flutter/material.dart';

class DifficultyElement extends StatefulWidget {
  const DifficultyElement({
    super.key,
    required this.difficulty,
    required this.groupValue,
    this.onChange,
  });
  final String difficulty;
  final String groupValue;
  final OnChangeCallBack? onChange;
  @override
  State<DifficultyElement> createState() => _DifficultyElementState();
}

typedef OnChangeCallBack = void Function(String?);

class _DifficultyElementState extends State<DifficultyElement> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '',
        style: _radioElementStyle(),
      ),
      leading: Radio<String>.adaptive(
        useCupertinoCheckmarkStyle: true,
        activeColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(
          (states) => states.contains(MaterialState.disabled)
              ? Colors.grey
              : Colors.white,
        ),
        value: widget.difficulty,
        groupValue: widget.groupValue,
        onChanged: widget.onChange,
      ),
    );
  }

  TextStyle _radioElementStyle() {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'EXO-R',
          color: Colors.white,
          fontWeight: FontWeight.w600,
        );
  }
}
