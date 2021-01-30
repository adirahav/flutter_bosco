import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dimens.dart';
import 'colors.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  bool showMenu;
  String childName;
  bool showChildAvatar;
  String childAvatar;
  TabController tabController;

  CustomAppBar({
    this.showMenu,
    this.childName,
    this.showChildAvatar,
    this.childAvatar,
    this.tabController,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: CustomColors.AppBarBackground,
      // leading: IconButton(
      //   onPressed: () {},
      //   icon: Icon(
      //     Icons.menu,
      //   ),
      // ),
      title: Text(
        this.childName,
        style: TextStyle(fontSize: CustomDimens.BigFontSize),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: this.showChildAvatar
              ? Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(this.childAvatar))))
              : Container(),
        ),
      ],
      bottom: this.tabController != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(.0),
              // child: Container(
              //   color: CustomColors.TabsBackground,
              //   height: 50.0,
              // ),
              child: Expanded(
                child: Container(
                  color: CustomColors.TabsBackground,
                  child: TabBar(
                    controller: this.tabController,
                    indicatorColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        icon: Text(
                          "Dashboard",
                          style:
                              TextStyle(fontSize: CustomDimens.NormalFontSize),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          "Daily report",
                          style:
                              TextStyle(fontSize: CustomDimens.NormalFontSize),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          "Notifications",
                          style:
                              TextStyle(fontSize: CustomDimens.NormalFontSize),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
