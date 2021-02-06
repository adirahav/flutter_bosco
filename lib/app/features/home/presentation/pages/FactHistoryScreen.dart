import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/app/features/home/presentation/widgets/FactList.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class FactHistoryScreen extends StatefulWidget {
  final List<Fact> facts;
  final FactCallback removeFact;

  FactHistoryScreen({this.facts, this.removeFact});

  @override
  _FactHistoryScreenState createState() => _FactHistoryScreenState();
}

class _FactHistoryScreenState extends State<FactHistoryScreen>
    with AutomaticKeepAliveClientMixin<FactHistoryScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FactList(facts: widget.facts, removeFact: widget.removeFact);
  }

  @override
  bool get wantKeepAlive => true;
}
