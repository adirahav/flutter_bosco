import 'package:bosco/login_page.dart';
import 'package:bosco/signUp_page.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'dimens.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.0), bottomRight: Radius.circular(20.0)),
      child: SizedBox(
        width: 300,
        child: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            //שהלמעלה של התפריט יהיה צמוד במקום שיהיה רווח אפור
            children: [
              Container(
                height: 156,
                child: DrawerHeader(
                  child: Center(
                    child: Text(
                      "Menu",
                      style: TextStyle(
                          fontSize: CustomDimens.BigFontSize,
                          color: Colors.white),
                    ),
                  ),
                  decoration:
                      BoxDecoration(color: CustomColors.AppBarBackground),
                ),
              ),
              ListTile(
                title: Center(
                  child: Text(
                    "התחברות",
                    style: TextStyle(fontSize: CustomDimens.BigFontSize),
                  ),
                ),
                subtitle: Center(child: Text("דף התחברות")),
                onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return loginPage();
              }),
            );
                },
              ),
              SizedBox(height: 10.0,),
              ListTile(
                title: Center(
                  child: Text(
                    "הרשמה",
                    style: TextStyle(fontSize: CustomDimens.BigFontSize),
                  ),
                ),
                subtitle: Center(child: Text("דף הרשמה")),
                onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return signUpPage();
              }),
            );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
