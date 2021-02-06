import 'package:bosco/core/constants/colors.dart';
import 'package:bosco/core/constants/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:bosco/app/cross_widgets/app_bar/app_bar.dart';
import 'form/custom_raised_button.dart';
import 'form/custom_text_field.dart';
import 'form/custom_input_date_picker.dart';
import 'form/gender_radio button.dart';

class AddChild extends StatelessWidget {
  const AddChild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormPage(
      body: SingleChildScrollView(
        child: FormFields(),
      ),
    );
  }
}

class FormFields extends StatelessWidget {
  const FormFields({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20),
          CustomTextField(
              attribute: 'child_name',
              hint: "Child Name",
              validators: [
                FormBuilderValidators.required(
                    errorText: "Child name cannot be empty"),
              ]),
          SizedBox(height: 20),
          CustomDatePicker(
            attribute: 'birthday',
            hint: "Birthday",
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Gender",
                style: TextStyle(color: CustomColors.Label),
              ),
              SizedBox(width: 20),
              GenderRadioButton(
                attribute: 'gender',
                labelBoy: 'Boy',
                assetSelectedBoy: "images/boy_selected.svg",
                assetOffBoy: "images/boy_off.svg",
                labelGirl: 'Girl',
                assetSelectedGirl: "images/girl_selected.svg",
                assetOffGirl: "images/girl_off.svg",
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomRaisedButton(
            text: "Save",
          ),
        ],
      ),
    );
  }
}

class FormPage extends StatelessWidget {
  final Widget body;
  final Icon icon;
  final Function onPressed;

  const FormPage({
    Key key,
    this.body,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 244, 242),
        drawer: CustomDrawer(),
        appBar: CustomAppBar(
          showMenu: true,
          childName: "Add child",
          showChildAvatar: false,
          childAvatar: null,
          tabController: null,
        ),
        body: body,
        bottomNavigationBar: BottomAppBar(
          child: MaterialButton(
            color: Colors.yellow,
            height: 100,
            child: icon,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
