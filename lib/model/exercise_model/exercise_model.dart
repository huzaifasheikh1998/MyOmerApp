import 'package:collection/collection.dart';

class ExerciseModel {
  String? id;
  String? day;
  String? mainHeading;
  String? subHeading;
  String? content;
  String? type;
  String? createdAt;
  String? isNotify;

  ExerciseModel({
    this.id,
    this.day,
    this.mainHeading,
    this.subHeading,
    this.content,
    this.type,
    this.createdAt,
    this.isNotify,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        id: json['id'] as String?,
        day: json['day'] as String?,
        mainHeading: json['main_heading'] as String?,
        subHeading: json['sub_heading'] as String?,
        content: json['content'] as String?,
        type: json['type'] as String?,
        createdAt: json['created_at'] as String?,
        isNotify: json['is_notify'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'main_heading': mainHeading,
        'sub_heading': subHeading,
        'content': content,
        'type': type,
        'created_at': createdAt,
        'is_notify': isNotify,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ExerciseModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      mainHeading.hashCode ^
      subHeading.hashCode ^
      content.hashCode ^
      type.hashCode ^
      createdAt.hashCode ^
      isNotify.hashCode;
}
