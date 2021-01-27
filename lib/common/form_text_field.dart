import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'colors.dart';

class FormTextField extends StatefulWidget {
  final String name;
  final String hintText;
  bool initialTextHide;
  final bool containeIcon;
  final IconData icon;
  final List<String Function(String)> validators;

  FormTextField({
    Key key,
    @required this.name,
    @required this.hintText,
    @required this.containeIcon,
    this.icon,
    this.validators,
    @required this.initialTextHide
  }) : super(key: key);

  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      textAlign: TextAlign.right,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: CustomColors.PinkBackgroung,
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.Title, width: 1.0)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColors.Title, width: 3.5)),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: widget.containeIcon
              ? Icon(
                  Icons.remove_red_eye,
                  color: widget.initialTextHide ? Colors.grey : Colors.black,
                )
              : //אייקון ריק
              Icon(
                  Icons.access_alarm,
                  color: Colors.transparent,
                ),
          onPressed: () {
            setState(() {
              widget.initialTextHide = !widget.initialTextHide;
            });
          },
        ),
      ),
      validator: FormBuilderValidators.compose(
        widget.validators,
      ),
      obscureText: widget.initialTextHide,
    );
  }
}