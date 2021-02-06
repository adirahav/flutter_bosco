import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:bosco/app/features/family_setup2/domain/usecases/get_children_usecase.dart';
import 'package:bosco/app/features/family_setup/presentation/widgets/ChildList.dart';
import 'package:bosco/core/service_locator.dart';
import 'package:flutter/material.dart';

import 'family_setup_page.dart';

class AddNewChildScreen extends StatefulWidget {
  final List<Child> children;
  final ChildCallback addChild;
  final GetChildrenUsecase getChildrenUsecase;

  AddNewChildScreen({this.children, this.addChild})
      : getChildrenUsecase = serviceLocatorChildren();

  @override
  _AddNewChildScreenState createState() => _AddNewChildScreenState();
}

class _AddNewChildScreenState extends State<AddNewChildScreen>
    with AutomaticKeepAliveClientMixin<AddNewChildScreen> {
  String text;
  bool isLoading = false;
  bool isError = false;
  String error;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Color.fromARGB(255, 199, 175, 255),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(height: 5),
                Text("New Child:", style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Expanded(child: Text("${text ?? "Tap For New Child"}")),
                isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text("Fech new child"),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            Future.delayed(Duration(milliseconds: 500))
                                .then((value) {
                              widget
                                  .getChildrenUsecase(
                                      params: Params(language: 'en'))
                                  .then((exceptionOrChild) {
                                setState(() {
                                  isLoading = false;
                                });
                                exceptionOrChild.fold(
                                  (exception) {
                                    isError = true;
                                    error = exception.toString();
                                  },
                                  (children) {
                                    isError = false;
                                    text = children[0].name;
                                    widget.addChild(children[0]);
                                  },
                                );
                              });
                            });
                          });
                        },
                      ),
                isError
                    ? Text(error, style: TextStyle(color: Colors.red))
                    : Text(""),
                SizedBox(
                  height: 5,
                ),
              ],
            )),
        Divider(),
        Expanded(child: ChildList(children: widget.children)),
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
