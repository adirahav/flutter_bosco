import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/app/features/home/presentation/pages/HomePage.dart';
import 'package:flutter/material.dart';

class FactList extends StatefulWidget {
  final List<Fact> facts;
  final FactCallback removeFact;

  const FactList({Key key, this.facts, this.removeFact}) : super(key: key);

  @override
  _FactListState createState() => _FactListState();
}

class _FactListState extends State<FactList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return widget.removeFact == null
            ? FactCard(fact: widget.facts[position])
            : Dismissible(
                onDismissed: (direction) {
                  widget.removeFact.call(widget.facts[position]);
                },
                background: Container(color: Colors.red),
                key: UniqueKey(),
                child: FactCard(fact: widget.facts[position]),
              );
      },
      itemCount: widget.facts.length,
    );
  }
}

class FactCard extends StatefulWidget {
  const FactCard({
    Key key,
    @required this.fact,
  }) : super(key: key);

  final Fact fact;

  @override
  _FactCardState createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Text(widget.fact.text),
      ),
    );
  }
}
