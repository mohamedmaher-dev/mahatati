import 'package:jiffy/jiffy.dart';

class FormatDate {
  String date;
  FormatDate({required this.date});
  String formatDate() {
    return Jiffy.parse(date).yMMMMEEEEdjm;
  }
}
