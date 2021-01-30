import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final String hint;
  final String attribute;
  final List<String Function(dynamic)> validators;
  const CustomDatePicker({
    Key key,
    this.hint,
    @required this.attribute,
    this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputDatePickerFormField(
      firstDate: DateTime(2014),
      lastDate: DateTime(2020, 12, 12),
      fieldHintText: hint,
      fieldLabelText: hint,
      //initialDate: DateTime.now(),
    );
  }
}
