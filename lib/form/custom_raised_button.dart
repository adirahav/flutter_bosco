import 'package:bosco/common/colors.dart';
import 'package:bosco/widgets/alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomRaisedButton extends StatelessWidget {
  final String text;

  const CustomRaisedButton({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 50,
      child: RaisedButton(
        child: Text("Save", style: TextStyle(color: CustomColors.ButtonText)),
        focusColor: CustomColors.Button,
        color: CustomColors.ButtonFocus,
        onPressed: () {
          if (FormBuilder.of(context).saveAndValidate()) {
            CustomAlertDialog(
                context, "Title", FormBuilder.of(context).value.toString());
          }
        },
      ),
    );
  }
}
