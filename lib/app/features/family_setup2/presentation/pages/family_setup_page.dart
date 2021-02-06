import 'package:bosco/app/cross_widgets/app_bar/app_bar.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup/presentation/pages/add_child_screen.dart';
import 'package:bosco/core/constants/drawer.dart';
import 'package:bosco/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'add_child_screen.dart';
import 'children_screen.dart';

class FamilySetupPage extends StatefulWidget {
  FamilySetupPage({Key key}) : super(key: key);

  @override
  _FamilySetupPageState createState() => _FamilySetupPageState();
}

typedef ChildCallback = void Function(Child child);

class _FamilySetupPageState extends State<FamilySetupPage> {
  List<Child> children = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: CustomDrawer(),
        appBar: CustomAppBar(
          showMenu: true,
          childName: "Family setup",
          showChildAvatar: false,
          childAvatar: null,
          tabController: null,
        ),
        body: TabBarView(
          children: [
            ChildrenScreen(
              removeChild: (child) {
                setState(() {
                  children.remove(child);
                });
              },
            ),
            AddNewChildScreen(
              children: children,
              addChild: (child) {
                setState(() {
                  children.insert(0, child);
                });
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigation.router.navigateTo(context, Navigation.addChild,
                transition: TransitionType.cupertino);
          },
        ),
      ),
    );
  }
}
