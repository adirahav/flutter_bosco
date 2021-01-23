import 'package:bosco/common/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common/colors.dart';
import 'common/app_bar.dart';
import 'common/drawer.dart';
import 'common/enums.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var sectionPadding = const EdgeInsets.only(
        left: CustomDimens.Padding,
        right: CustomDimens.Padding,
        bottom: CustomDimens.Padding);

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(
        showMenu: true,
        childName: "Title",
        showChildAvatar: true,
        childAvatar: "https://i.imgur.com/BoN9kdC.png",
        tabController: this._tabController,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          color: CustomColors.PinkBackgroung,
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
              ChildCallMood(
                sectionPadding: sectionPadding,
                callMood: CallMood.Happy,
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
class ChildCallMood extends StatelessWidget {
  String title;
  CallMood callMood;

  ChildCallMood({
    this.title,
    this.callMood,
    Key key,
    @required this.sectionPadding,
  }) : super(key: key);

  final EdgeInsets sectionPadding;

  @override
  Widget build(BuildContext context) {
    String icon = callMood == CallMood.Happy
        ? "CallHappyIcon"
        : callMood == CallMood.Normal
            ? "CallNormalIcon"
            : "CallBadIcon";

    String sounded = callMood == CallMood.Happy
        ? "Sounded fine"
        : callMood == CallMood.Normal
            ? "Sounded normal"
            : "Sounded bad";

    return Padding(
      padding: sectionPadding,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Call mood",
                style: Title(),
              ),
              Padding(
                padding: const EdgeInsets.all(CustomDimens.Padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(CustomDimens.Padding),
                      child: Image(
                        image: AssetImage("images/" + icon + ".jpg"),
                        width: 50.0,
                        height: 50.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: CustomDimens.Padding,
                          top: CustomDimens.Padding * 2),
                      child: Text(
                        sounded,
                        style: TextStyle(
                            fontSize: CustomDimens.NormalFontSize + 6,
                            color: CustomColors.Title,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
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

// ignore: non_constant_identifier_names
TextStyle Title() {
  return TextStyle(
      fontSize: CustomDimens.NormalFontSize - 2,
      color: CustomColors.Title,
      fontWeight: FontWeight.bold);
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
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Row(
                  children: [
                    Text(
                      this.title,
                      style: Title(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image(
                        image: AssetImage("images/WhatsappIcon.png"),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image(
                        image: AssetImage("images/InstagramIcon.png"),
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "0 | 0",
                    style: TextStyle(
                        fontSize: CustomDimens.BigFontSize - 2,
                        color: Colors.grey),
                  ),
                  Text(
                    "0 | 0",
                    style: TextStyle(
                        fontSize: CustomDimens.BigFontSize - 2,
                        color: Colors.grey),
                  ),
                ],
              ))
            ],
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
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: CustomColors.AlertBackground,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Child’s device unavailable",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: CustomDimens.NormalFontSize + 2),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text("Since Monday, 10 January",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: CustomDimens.SmallFontSize + 5))
                ],
              ),
            ),
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
