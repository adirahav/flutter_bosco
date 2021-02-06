import 'package:bosco/add_child.dart';
import 'package:bosco/home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'app/features/family_setup/presentation/pages/family_setup_page.dart';

class Navigation {
  static final router = FluroRouter();
  static final home = "/home";
  static final familySetup = "/family_setup";
  static final addChild = "add_child";
}

var homeHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});

var familySetupHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return FamilySetupPage();
});

var addChildHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return AddChild();
});

void defineRoutes(FluroRouter router) {
  router.define(Navigation.familySetup, handler: familySetupHandler);
  router.define(Navigation.addChild, handler: addChildHandler);
}
