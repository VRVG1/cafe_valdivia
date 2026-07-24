import 'package:freezed_annotation/freezed_annotation.dart';

class BoolToIntConverter implements JsonConverter<bool?, int?> {
  const BoolToIntConverter();

  @override
  bool? fromJson(int? json) => json == null ? null : json == 1;

  @override
  int? toJson(bool? object) => object == null ? null : (object ? 1 : 0);
}

class IntToBoolConverter implements JsonConverter<bool, int> {
  const IntToBoolConverter();

  @override
  bool fromJson(int json) => json == 1;

  @override
  int toJson(bool object) => object ? 1 : 0;
}

Map<String, dynamic> sanitizeMapForDb(Map<String, dynamic> map) {
  return map.map((key, value) {
    if (value is bool) return MapEntry(key, value ? 1 : 0);
    return MapEntry(key, value);
  });
}
