import 'package:bosco/common/routes.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  defineRoutes(Navigation.router);
  runApp(MyApp());
}

final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      // context,
      key: _fbKey,
      // autovalidate: true,
      initialValue: {},
      child: MaterialApp(
        title: 'Bosco',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(), //FormSecondPage(),
      ),
    );
  }
}
