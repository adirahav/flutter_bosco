import 'package:bosco/common/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common/colors.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'common/form_text_field.dart';


class signUpPage extends StatefulWidget {
  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: CustomColors.PinkBackgroung,
      appBar: AppBar(
        backgroundColor: CustomColors.PinkBackgroung,
        elevation: 0.0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text("הרשם",
              style: TextStyle(
                  fontSize: CustomDimens.BigFontSize + 10,
                  color: CustomColors.Title,
                  fontWeight: FontWeight.bold)),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: FormBuilder(
          key: _fbKey,
          initialValue: {},
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50.0),
                FormTextField(
                  name: 'Email',
                  hintText: 'דוא"ל',
                  initialTextHide: false,
                  containeIcon: false,
                  validators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context)
                  ],
                ),
                SizedBox(height: 20),
                FormTextField(
                  name: 'confirmEmail',
                  hintText: 'הקלד דוא"ל שנית',
                  initialTextHide: false,
                  containeIcon: false,
                  validators: [
                    FormBuilderValidators.required(context),
                    FormBuilderValidators.email(context)
                  ],
                ),
                SizedBox(height: 20),
                FormTextField(
                  name: 'Password',
                  hintText: 'סיסמה',
                  initialTextHide: true,
                  containeIcon: true,
                  validators: [FormBuilderValidators.required(context), FormBuilderValidators.minLength(context, 8)],
                ),
                SizedBox(height: 120.0),
                Container(
                  width: 250,
                  height: 75,
                  child: RaisedButton(
                    color: Colors.lightBlue[300],
                    child: Text(
                      "הרשם",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            "התחבר",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: CustomColors.Title,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          onTap: () {},
                        ),
                        Text(
                          "יש לך חשבון? ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20.0,
                              color: CustomColors.Title,
                              fontWeight: FontWeight.normal),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}