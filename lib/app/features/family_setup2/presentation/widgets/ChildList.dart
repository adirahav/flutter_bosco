import 'package:bosco/app/cross_widgets/text_styles/header1.dart';
import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup/presentation/pages/family_setup_page.dart';
import 'package:bosco/core/constants/dimens.dart';
import 'package:flutter/material.dart';

class ChildList extends StatefulWidget {
  final List<Child> children;
  final ChildCallback removeChild;

  const ChildList({Key key, this.children, this.removeChild}) : super(key: key);

  @override
  _ChildListState createState() => _ChildListState();
}

class _ChildListState extends State<ChildList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        return widget.removeChild == null
            ? ChildCard(child: widget.children[position])
            : Dismissible(
                onDismissed: (direction) {
                  widget.removeChild.call(widget.children[position]);
                },
                background: Container(color: Colors.red),
                key: UniqueKey(),
                child: ChildCard(child: widget.children[position]),
              );
      },
      itemCount: widget.children.length,
    );
  }
}

class ChildCard extends StatefulWidget {
  const ChildCard({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Child child;

  @override
  _ChildCardState createState() => _ChildCardState();
}

class _ChildCardState extends State<ChildCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(CustomDimens.Padding),
          child: Row(
            children: [
              Container(
                  width: 35.0,
                  height: 35.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(widget.child.avatarUrl)))),
              Padding(
                padding: const EdgeInsets.only(
                    left: CustomDimens.Padding, right: CustomDimens.Padding),
                child: Header1(text: widget.child.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
