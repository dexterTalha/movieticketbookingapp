import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  //calendar controller

  static CalendarController instance = Get.find();
  late Rx<DateTime> selectedMovieDate;
  final DateFormat format = DateFormat("EEEE, MMM dd, yyyy");
  final DateTime todayDate = DateTime.now();
  List<DateTime> thisWeek = [], nextWeek = [];

  @override
  void onReady() {
    selectedMovieDate = DateTime.now().obs;
    updateWeekDay();
  }

  //getting the list of date in a week
  updateWeekDay() {
    thisWeek = [];
    nextWeek = [];
    var weekday = todayDate.weekday;
    var w = weekday;
    // w - 1 means first day of week is monday
    DateTime thisWeekDate = todayDate.subtract(Duration(days: w - 1));

    for (int i = 0; i < 8; i++) {
      //next week will be ahead of 7 days so adding days => 7 + i
      nextWeek.add(thisWeekDate.add(Duration(days: 7 + i)));
      thisWeek.add(thisWeekDate.add(Duration(days: i)));
    }
  }

  //back to initial date
  updateToInitailDate() {
    selectedMovieDate.value = DateTime.now();
    update();
  }

  // updating the selected date
  updateMovieDate(DateTime date) {
    selectedMovieDate = date.obs;
    update();
  }
}
