import 'package:collection/collection.dart';

class DecisionModel {
  String? id;
  String? day;
  String? date;
  String? comment;
  String? createdAt;
  String? isNotify;
  String? userId;

  DecisionModel({
    this.id,
    this.day,
    this.date,
    this.comment,
    this.createdAt,
    this.isNotify,
    this.userId,
  });

  factory DecisionModel.fromJson(Map<String, dynamic> json) => DecisionModel(
        id: json['id'] as String?,
        day: json['day'] as String?,
        date: json['date'] as String?,
        comment: json['comment'] as String?,
        createdAt: json['created_at'] as String?,
        isNotify: json['is_notify'] as String?,
        userId: json['user_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'date': date,
        'comment': comment,
        'created_at': createdAt,
        'is_notify': isNotify,
        'user_id': userId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! DecisionModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      date.hashCode ^
      comment.hashCode ^
      createdAt.hashCode ^
      isNotify.hashCode ^
      userId.hashCode;
}
