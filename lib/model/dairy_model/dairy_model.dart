import 'package:collection/collection.dart';

class DairyModel {
  String? id;
  String? userId;
  String? day;
  String? date;
  String? comment;
  String? createdAt;

  DairyModel({
    this.id,
    this.userId,
    this.day,
    this.date,
    this.comment,
    this.createdAt,
  });

  factory DairyModel.fromJson(Map<String, dynamic> json) => DairyModel(
        id: json['id'] as String?,
        userId: json['user_id'] as String?,
        day: json['day'] as String?,
        date: json['date'] as String?,
        comment: json['comment'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'day': day,
        'date': date,
        'comment': comment,
        'created_at': createdAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DairyModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      userId.hashCode ^
      day.hashCode ^
      date.hashCode ^
      comment.hashCode ^
      createdAt.hashCode;
}
