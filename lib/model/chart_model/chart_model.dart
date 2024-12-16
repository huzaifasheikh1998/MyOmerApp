import 'package:collection/collection.dart';

import 'day.dart';

class ChartModel {
  String? week;
  List<Day>? days;

  ChartModel({this.week, this.days});

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        week: json['week'] as String?,
        days: (json['days'] as List<dynamic>?)
            ?.map((e) => Day.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'week': week,
        'days': days?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ChartModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => week.hashCode ^ days.hashCode;
}
