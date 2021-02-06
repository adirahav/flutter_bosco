import 'package:bosco/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bosco/core/service_locator.dart' as sl;

import 'app/features/family_setup/presentation/pages/family_setup_page.dart';

void main() async {
  defineRoutes(Navigation.router);
  //runApp(MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
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
        home: FamilySetupPage(), //Home(), //FormSecondPage(),
      ),
    );
  }
}
