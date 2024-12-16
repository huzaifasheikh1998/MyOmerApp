import 'package:collection/collection.dart';

class VideoModel {
  String? id;
  String? day;
  String? mainHeading;
  String? subHeading;
  String? title;
  String? content;
  String? link;
  String? createdAt;

  VideoModel({
    this.id,
    this.day,
    this.mainHeading,
    this.subHeading,
    this.title,
    this.content,
    this.link,
    this.createdAt,
  });

  factory VideoModel.fromJson(Map<dynamic, dynamic> json) => VideoModel(
        id: json['id'] as String?,
        day: json['day'] as String?,
        mainHeading: json['main_heading'] as String?,
        subHeading: json['sub_heading'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        link: json['link'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'main_heading': mainHeading,
        'sub_heading': subHeading,
        'title': title,
        'content': content,
        'link': link,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VideoModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      mainHeading.hashCode ^
      subHeading.hashCode ^
      title.hashCode ^
      content.hashCode ^
      link.hashCode ^
      createdAt.hashCode;
}
