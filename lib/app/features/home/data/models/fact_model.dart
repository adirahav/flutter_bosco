import 'package:bosco/app/features/home/domain/entities/fact.dart';
import 'package:meta/meta.dart';

///
/// all of the models used as
///
///
///
class FactModel extends Fact {
  FactModel({
    @required String id,
    @required String text,
    @required String source,
  }) : super(id: id, text: text, source: source);

  factory FactModel.fromJson(Map<String, dynamic> json) {
    return FactModel(
      id: json['id'],
      text: json['text'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'source': source,
    };
  }

  ///
  /// In a real big app, here is should be methods
  /// that are relevant to the Remote/Device, For example:
  /// `CSV getFactAsCSV(){...}`,
  /// This function are useable for the Data developers only, thus
  /// with this architecture of the project, this function is implemented here
  /// and other funcitons that are in use at the Domain/Presentation layers,
  /// are implemented in the Entity(domain) level.
  ///
}
