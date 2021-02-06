import 'package:bosco/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String attribute;
  final List<String Function(dynamic)> validators;
  const CustomTextField({
    Key key,
    this.hint,
    @required this.attribute,
    this.validators,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      initialValue: "",
      attribute: attribute,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.transparent,
          //border: InputBorder.none,
          enabledBorder: new UnderlineInputBorder(
            borderRadius: new BorderRadius.circular(0.0),
            borderSide: BorderSide(
                color: CustomColors.InputBorder, style: BorderStyle.solid),
          ),
          focusedBorder: new UnderlineInputBorder(
            borderRadius: new BorderRadius.circular(0.0),
            borderSide: BorderSide(
                color: CustomColors.InputBorderFocus, style: BorderStyle.solid),
          ),
          errorBorder: new UnderlineInputBorder(
            borderRadius: new BorderRadius.circular(0.0),
            borderSide: BorderSide(
                color: CustomColors.InputBorderError,
                width: 1,
                style: BorderStyle.solid),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Color.fromARGB(255, 188, 180, 172))),
      validators: validators ?? [],
    );
  }
}
