import 'package:bosco/app/features/family_setup/domain/entities/child.dart';
import 'package:meta/meta.dart';

///
/// all of the models used as
///
///
///
class ChildModel extends Child {
  ChildModel({
    @required String id,
    @required String name,
    @required String avatarUrl,
  }) : super(id: id, name: name, avatarUrl: avatarUrl);

  factory ChildModel.fromJson(Map<String, dynamic> json) {
    return ChildModel(
      id: json['id'],
      name: json['name'],
      avatarUrl: json['avatar_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
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
