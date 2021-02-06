import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup2/domain/usecases/get_children_usecase.dart';
//import 'package:bosco/app/features/family_setup/presentation/widgets/ChildList.dart';
import 'package:bosco/core/service_locator.dart';
import 'package:flutter/material.dart';

import 'family_setup_page.dart';

class ChildrenScreen extends StatefulWidget {
  final ChildCallback removeChild;
  final GetChildrenUsecase getChildrenUsecase;

  ChildrenScreen({this.removeChild})
      : getChildrenUsecase = serviceLocatorChildren();

  @override
  _ChildrenScreenState createState() => _ChildrenScreenState();
}

class _ChildrenScreenState extends State<ChildrenScreen>
    with AutomaticKeepAliveClientMixin<ChildrenScreen> {
  /*Future getData() async {
    widget
        .getChildrenUsecase(params: Params(language: 'en'))
        .then((exceptionOrChild) {
      setState(() {
        //isLoading = false;
        debugPrint("setState");
      });
      exceptionOrChild.fold(
        (exception) {
          debugPrint("exception = " + exception.toString());
          //isError = true;
          //error = exception.toString();
        },
        (children) {
          children = children;
          debugPrint("children = " + children.toString());
          //isError = false;
          //text = children[0].name;
          //widget.addChild(children[0]);
        },
      );
    });
  }*/

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Future<List<Child>> children;

    debugPrint("children = " + children.toString());
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline2,
      textAlign: TextAlign.center,
      child: FutureBuilder<List<Child>>(
        future: children, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<List<Child>> snapshot) {
          widget
              .getChildrenUsecase(params: Params(language: 'en'))
              .then((exceptionOrChild) {
            //setState(() {
            //isLoading = false;
            //  debugPrint("setState");
            //});
            exceptionOrChild.fold(
              (exception) {
                debugPrint("exception = " + exception.toString());
                //isError = true;
                //error = exception.toString();
              },
              (children) {
                children = children;
                debugPrint("children = " + children.toString());
                //isError = false;
                //text = children[0].name;
                //widget.addChild(children[0]);
              },
            );
          });

          //return ChildList(children: children, removeChild: widget.removeChild);
          return Container();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
