import 'package:collection/collection.dart';

class BlessingModel {
  String? id;
  String? day;
  String? type;
  String? title;
  String? content;
  String? date;
  String? createdAt;

  BlessingModel({
    this.id,
    this.day,
    this.type,
    this.title,
    this.content,
    this.date,
    this.createdAt,
  });

  factory BlessingModel.fromJson(Map<String, dynamic> json) => BlessingModel(
        id: json['id'] as String?,
        day: json['day'] as String?,
        type: json['type'] as String?,
        title: json['title'] as String?,
        content: json['content'] as String?,
        date: json['date'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'type': type,
        'title': title,
        'content': content,
        'date': date,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! BlessingModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      type.hashCode ^
      title.hashCode ^
      content.hashCode ^
      date.hashCode ^
      createdAt.hashCode;
}
