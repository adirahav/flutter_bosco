import 'package:bosco/common/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common/colors.dart';
import 'common/app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var sectionPadding = const EdgeInsets.only(
        left: CustomDimens.Padding,
        right: CustomDimens.Padding,
        bottom: CustomDimens.Padding);

    return Scaffold(
      appBar: CustomAppBar(
          showMenu: true,
          childName: "Adi",
          showChildAvatar: true,
          childAvatar: "https://i.imgur.com/BoN9kdC.png"),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: CustomColors.Background,
          child: Column(
            children: [
              ChildAvatar(),
              Padding(
                padding: sectionPadding,
                child: Row(
                  children: [
                    Section(title: "Screen time"),
                  ],
                ),
              ),
              Padding(
                padding: sectionPadding,
                child: Row(
                  children: [
                    Section(title: "Messages"),
                    SizedBox(
                      width: CustomDimens.Padding,
                    ),
                    Section(
                      title: "Notifications",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: sectionPadding,
                child: Row(
                  children: [
                    Section(
                      title: "Photos & YouTube videos",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: sectionPadding,
                child: Row(
                  children: [
                    Section(title: "Call mood"),
                  ],
                ),
              ),
              ChildLocation(),
              Padding(
                padding: sectionPadding,
                child: Row(
                  children: [
                    SocialMedia(),
                    SizedBox(
                      width: CustomDimens.Padding,
                    ),
                    SocialMedia(),
                    SizedBox(
                      width: CustomDimens.Padding,
                    ),
                    SocialMedia(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Section extends StatelessWidget {
  String title;

  Section({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          width: double.infinity,
          height: 100,
          color: Colors.blue,
          child: Row(
            children: [Text(this.title)],
          ),
        ));
  }
}

class ChildAvatar extends StatelessWidget {
  const ChildAvatar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: CustomDimens.Padding),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: Colors.green,
          ),
          Container(
            width: double.infinity,
            height: 50,
            color: CustomColors.AlertBackground,
          ),
        ],
      ),
    );
  }
}

class ChildLocation extends StatelessWidget {
  const ChildLocation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: CustomDimens.Padding),
      child: Container(
        width: double.infinity,
        height: 150,
        color: Colors.amber,
      ),
    );
  }
}

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.red,
      ),
    );
  }
}
