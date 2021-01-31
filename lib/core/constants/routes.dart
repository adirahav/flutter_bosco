import 'package:bosco/presentation/pages/home.dart';
import 'package:bosco/presentation/pages/login_page.dart';
import 'package:bosco/presentation/pages/signUp_page.dart';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class Navigation {
  static final router = FluroRouter();
  static final String loginPageName = "/loginPage";
  static final String signUpPageName = "/signUpPage";
  static final String home = "/home";
}

var loginPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return loginPage();
});

var signUpPageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return signUpPage();
});

var homePageHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});

void defineRoutes(FluroRouter router) {
  router.define(Navigation.loginPageName, handler: loginPageHandler);
  router.define(Navigation.signUpPageName, handler: signUpPageHandler);
  router.define(Navigation.home, handler: homePageHandler);
}