import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

///
/// Fact is the entity that contains the data to present in the presentation layer
///
class Fact extends Equatable {
  final String id;
  final String text;
  final String source;

  Fact({
    @required this.id,
    @required this.text,
    @required this.source,
  });

  @override
  List<Object> get props => [id, text, source];
}
