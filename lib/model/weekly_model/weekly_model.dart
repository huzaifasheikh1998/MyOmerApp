import 'package:collection/collection.dart';

class WeeklyModel {
  String? id;
  String? week;
  String? day;
  String? mainHeading;
  String? subHeading;
  String? title;
  String? content;
  String? date;
  String? createdAt;

  WeeklyModel({
    this.id,
    this.week,
    this.day,
    this.mainHeading,
    this.subHeading,
    this.title,
    this.content,
    this.date,
    this.createdAt,
  });

  factory WeeklyModel.fromJson(Map<String, dynamic> json) => WeeklyModel(
        id: json['id'] as String?,
        week: json['week'] as String?,
        day: json['day'] as String?,
        mainHeading: json['main_heading'] as String?,
        subHeading: json['sub_heading'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        date: json['date'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'week': week,
        'day': day,
        'main_heading': mainHeading,
        'sub_heading': subHeading,
        'title': title,
        'content': content,
        'date': date,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! WeeklyModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      week.hashCode ^
      day.hashCode ^
      mainHeading.hashCode ^
      subHeading.hashCode ^
      title.hashCode ^
      content.hashCode ^
      date.hashCode ^
      createdAt.hashCode;
}
