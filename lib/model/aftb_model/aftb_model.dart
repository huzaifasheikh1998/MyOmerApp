import 'package:collection/collection.dart';

class AftbModel {
  String? id;
  String? day;
  String? date;
  String? incident;
  String? outcome;
  String? createdAt;
  String? isNotify;
  String? userId;

  AftbModel({
    this.id,
    this.day,
    this.date,
    this.incident,
    this.outcome,
    this.createdAt,
    this.isNotify,
    this.userId,
  });

  factory AftbModel.fromJson(Map<String, dynamic> json) => AftbModel(
        id: json['id'] as String?,
        day: json['day'] as String?,
        date: json['date'] as String?,
        incident: json['incident'] as String?,
        outcome: json['outcome'] as String?,
        createdAt: json['created_at'] as String?,
        isNotify: json['is_notify'] as String?,
        userId: json['user_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'day': day,
        'date': date,
        'incident': incident,
        'outcome': outcome,
        'created_at': createdAt,
        'is_notify': isNotify,
        'user_id': userId,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AftbModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      day.hashCode ^
      date.hashCode ^
      incident.hashCode ^
      outcome.hashCode ^
      createdAt.hashCode ^
      isNotify.hashCode ^
      userId.hashCode;
}
