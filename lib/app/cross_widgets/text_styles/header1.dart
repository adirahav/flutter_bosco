import 'package:bosco/core/constants/colors.dart';
import 'package:bosco/core/constants/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Header1 extends StatelessWidget {
  String text;

  Header1({
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      style: TextStyle(
          fontSize: CustomDimens.NormalFontSize + 6,
          color: CustomColors.Title,
          fontWeight: FontWeight.bold),
    );
  }
}
