import 'package:bosco/routes.dart';
import 'package:fluro/fluro.dart';
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
              DrawerItem(
                  icon: Icons.people_outline,
                  title: "Family setup",
                  navigateTo: Navigation.familySetup),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DrawerItem extends StatelessWidget {
  IconData icon;
  String title;
  String navigateTo;

  DrawerItem({
    this.icon,
    this.title,
    this.navigateTo,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        this.icon,
        color: CustomColors.DrawerIcon,
      ),
      title: Text(
        this.title,
        style: TextStyle(
            fontSize: CustomDimens.NormalFontSize,
            color: CustomColors.DrawerText),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: CustomColors.DrawerArrow,
      ),
      onTap: () {
        Navigation.router.navigateTo(context, Navigation.familySetup,
            transition: TransitionType.cupertino);
      },
    );
  }
}
