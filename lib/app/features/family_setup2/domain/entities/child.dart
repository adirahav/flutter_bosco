import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

///
/// Child is the entity that contains the data to present in the presentation layer
///
class Child extends Equatable {
  final String id;
  final String name;
  final String avatarUrl;

  Child({
    @required this.id,
    @required this.name,
    @required this.avatarUrl,
  });

  @override
  List<Object> get props => [id, name, avatarUrl];
}
