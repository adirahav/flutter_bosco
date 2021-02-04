import 'package:bosco/core/constants/colors.dart';
import 'package:bosco/core/constants/dimens.dart';
import 'package:bosco/core/constants/routes.dart';
import 'package:bosco/presentation/widgets/form_text_field.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class loginPage extends StatefulWidget {

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
          child: Text("התחבר",
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
                  textInputType: TextInputType.emailAddress,
                  initialTextHide: false,
                  containeIcon: false,
                  validators: [
                    FormBuilderValidators.required(context, errorText: "!שדה חובה"),
                    FormBuilderValidators.email(context)
                  ],
                ),
                SizedBox(height: 20),
                FormTextField(
                  name: 'Password',
                  hintText: 'סיסמה',
                  initialTextHide: true,
                  containeIcon: true,
                  validators: [FormBuilderValidators.required(context, errorText: "!שדה חובה")],
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      "שכחתי סיסמה",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: CustomColors.Title,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      Navigation.router.navigateTo(context, Navigation.home,
                          replace: true, transition: TransitionType.fadeIn);
                    },
                  ),
                ),
                SizedBox(height: 120.0),
                Container(
                  width: 250,
                  height: 75,
                  child: RaisedButton(
                    color: Colors.lightBlue[300],
                    child: Text(
                      "התחבר",
                      style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      if (_fbKey.currentState.saveAndValidate()) {
                        print(_fbKey.currentState.value);
                        Navigation.router.navigateTo(context, Navigation.home,
                            replace: true, transition: TransitionType.fadeIn);
                      }
                    },
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
                            "הרשם",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 20.0,
                              color: CustomColors.Title,
                              fontWeight: FontWeight.bold,
                            ),
                            textDirection: TextDirection.rtl,
                          ),
                          onTap: () {
                            Navigation.router.navigateTo(
                                context, Navigation.signUpPageName,
                                replace: true,
                                transition: TransitionType.inFromLeft);
                          },
                        ),
                        Text(
                          "אין לך חשבון? ",
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
