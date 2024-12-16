import 'package:collection/collection.dart';

class Day {
  String? number;
  String? active;
  String? mainHeading;
  String? subHeading;
  String? title;
  String? content;

  Day({
    this.number,
    this.active,
    this.mainHeading,
    this.subHeading,
    this.title,
    this.content,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
        number: json['number'] as String?,
        active: json['active'] as String?,
        mainHeading: json['main_heading'] as String?,
        subHeading: json['sub_heading'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'active': active,
        'main_heading': mainHeading,
        'sub_heading': subHeading,
        'title': title,
        'content': content,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Day) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      number.hashCode ^
      active.hashCode ^
      mainHeading.hashCode ^
      subHeading.hashCode ^
      title.hashCode ^
      content.hashCode;
}
