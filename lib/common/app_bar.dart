import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  bool showMenu;
  String childName;
  bool showChildAvatar;
  String childAvatar;

  CustomAppBar({
    this.showMenu,
    this.childName,
    this.showChildAvatar,
    this.childAvatar,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.AppBarBackground,
      leading: GestureDetector(
        onTap: () {},
        child: Icon(
          Icons.menu,
        ),
      ),
      title: Text(this.childName),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Container(
              width: 35.0,
              height: 35.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.fill,
                      image: new NetworkImage(this.childAvatar)))),
        ),
      ],
      bottom: PreferredSize(
          child: Container(
            color: CustomColors.TabsBackground,
            height: 50.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
    );
  }
}
