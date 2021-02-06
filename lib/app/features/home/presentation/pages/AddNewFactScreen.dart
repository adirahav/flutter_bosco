import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:bosco/app/features/home/domain/usecases/fetch_new_fact_usecase.dart';
import 'package:bosco/app/features/home/presentation/widgets/FactList.dart';
import 'package:bosco/core/service_locator.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class FetchNewFactScreen extends StatefulWidget {
  final List<Fact> facts;
  final FactCallback addFact;
  final GetRandomFactUsecase getRandomFactUsecase;

  FetchNewFactScreen({this.facts, this.addFact})
      : getRandomFactUsecase = serviceLocatorFact();

  @override
  _FetchNewFactScreenState createState() => _FetchNewFactScreenState();
}

class _FetchNewFactScreenState extends State<FetchNewFactScreen>
    with AutomaticKeepAliveClientMixin<FetchNewFactScreen> {
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
                Text("New Fact:", style: TextStyle(fontSize: 20)),
                SizedBox(height: 5),
                Expanded(child: Text("${text ?? "Tap For New Facts"}")),
                isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text("Fech new fact"),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                            Future.delayed(Duration(milliseconds: 500))
                                .then((value) {
                              widget
                                  .getRandomFactUsecase(
                                      params: Params(language: 'en'))
                                  .then((exceptionOrfact) {
                                setState(() {
                                  isLoading = false;
                                });
                                exceptionOrfact.fold(
                                  (exception) {
                                    isError = true;
                                    error = exception.toString();
                                  },
                                  (fact) {
                                    isError = false;
                                    text = fact.text;
                                    widget.addFact(fact);
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
        Expanded(child: FactList(facts: widget.facts)),
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
