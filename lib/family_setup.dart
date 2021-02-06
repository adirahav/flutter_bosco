import 'package:bosco/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'core/constants/drawer.dart';
import 'app/cross_widgets/app_bar/app_bar.dart';

class FamilySetup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        showMenu: true,
        childName: "Family setup",
        showChildAvatar: false,
        childAvatar: null,
        tabController: null,
      ),
      body: SingleChildScrollView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigation.router.navigateTo(context, Navigation.addChild,
              transition: TransitionType.cupertino);
        },
      ),
    );
  }
}
