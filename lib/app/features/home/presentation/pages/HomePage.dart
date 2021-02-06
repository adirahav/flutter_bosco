import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:flutter/material.dart';

import 'AddNewFactScreen.dart';
import 'FactHistoryScreen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

typedef FactCallback = void Function(Fact f);

class _HomePageState extends State<HomePage> {
  List<Fact> facts = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            unselectedLabelColor: Colors.purple,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurpleAccent, Colors.purpleAccent]),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ),
                color: Colors.redAccent),
            tabs: [
              Tab(icon: Icon(Icons.get_app), text: "Fetch Facts"),
              Tab(icon: Icon(Icons.history), text: "Facts History"),
            ],
          ),
          centerTitle: true,
          title: Text(
            'Facts App',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FetchNewFactScreen(
              facts: facts,
              addFact: (fact) {
                setState(() {
                  facts.insert(0, fact);
                });
              },
            ),
            FactHistoryScreen(
              facts: facts,
              removeFact: (fact) {
                setState(() {
                  facts.remove(fact);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
