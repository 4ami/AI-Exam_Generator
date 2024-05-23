import 'package:flutter/material.dart';

typedef OnChangeCallBack = Function(bool?);

class TypeElement extends StatefulWidget {
  const TypeElement({
    super.key,
    required this.onChange,
    required this.typName,
    required this.typeValue,
  });
  final OnChangeCallBack onChange;
  final String typName;
  final bool typeValue;
  @override
  State<TypeElement> createState() => _TypeElementState();
}

class _TypeElementState extends State<TypeElement> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.typName, style: _elementStyle()),
      leading: Checkbox(
        activeColor: Colors.green[400],
        value: widget.typeValue,
        onChanged: widget.onChange,
      ),
    );
  }

  TextStyle _elementStyle() {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: 'EXO-R',
          color: Colors.white,
        );
  }
}
