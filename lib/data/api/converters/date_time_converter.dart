import 'package:json_annotation/json_annotation.dart';

import '../../../share/constant/constant.dart';
import '../../../share/util/date_time_utils.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String? strDate) {
    if (strDate == null) return null as DateTime;
    final format = strDate.contains("T") ? DATE_TIME_FORMAT : DATE_TIME_FORMAT3;
    final dateNew = parseDate(strDate, format, utc: false)!;
    return dateNew;
  }

  @override
  String toJson(DateTime date) => formatDate(date, DATE_TIME_FORMAT)!;
}

class DateConverter implements JsonConverter<DateTime, String> {
  const DateConverter();

  @override
  DateTime fromJson(String strDate) {
    return parseDate(strDate, DATE_FORMAT, utc: false)!;
  }

  @override
  String toJson(DateTime date) => formatDate(date, DATE_FORMAT)!;
}
