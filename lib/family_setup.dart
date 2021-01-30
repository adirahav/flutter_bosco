import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common/app_bar.dart';
import 'common/drawer.dart';
import 'common/routes.dart';

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
