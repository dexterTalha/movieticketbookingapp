import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/auth_controller.dart';
import '../controllers/calendar_controller.dart';
import '../utils/mytheme.dart';

class CustomCalendar extends StatelessWidget {
  CustomCalendar({Key? key}) : super(key: key);
  final todayDate = DateTime.now();
  CalendarController calendarController = Get.find();
  //format for the date
  final DateFormat format = DateFormat("EEEE, MMM dd, yyyy");
  //taking the same of week only the first letter
  var days = DateFormat.E(Platform.localeName).dateSymbols.STANDALONENARROWWEEKDAYS;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              format.format(calendarController.selectedMovieDate.value),
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            //the first block is blank
            children: List.generate(8, (index) {
              if (index == 0) {
                return Container(
                  width: 40,
                );
              }

              //logic to get the first day of week that is Sunday to last
              String text = index < 7 ? days[index] : days[0];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(text),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),

          //generating day of the current week
          Row(
            children: List.generate(
              8,
              (index) {
                if (index == 0) {
                  return Container(
                    width: 40,
                    child: const Text(
                      "This week",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 10),
                    ),
                  );
                }
                DateTime text = calendarController.thisWeek[index - 1];

                final DateFormat format = DateFormat("dd");
                bool isSelected =
                    this.format.format(text) == this.format.format(calendarController.selectedMovieDate.value);
                //print("Selected Date: $isSelected ${this.format.format(calendarController.selectedMovieDate.value)} ${this.format.format(text)}");
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      //print(text.isBefore(todayDate.subtract(const Duration(days: 1))));
                      if (text.isBefore(todayDate.subtract(const Duration(days: 1)))) {
                        AuthController.instance.getErrorSnackBarNew("Cannot select previous date");
                        return;
                      }
                      calendarController.updateMovieDate(text);

                      Navigator.pop(context, calendarController.selectedMovieDate.value);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: isSelected ? MyTheme.splash : const Color(0xfff8f8f8),
                      ),
                      child: Center(
                        child: Text(
                          format.format(calendarController.thisWeek[index - 1]),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),

          //generating day of the next week
          Row(
            children: List.generate(
              8,
              (index) {
                if (index == 0) {
                  return Container(
                    width: 40,
                    child: const Text(
                      "Next week",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 10),
                    ),
                  );
                }
                DateTime text = calendarController.nextWeek[index - 1];
                final DateFormat format = DateFormat("dd");
                bool isSelected = text == calendarController.selectedMovieDate.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: GestureDetector(
                    onTap: () {
                      calendarController.updateMovieDate(text);
                      Navigator.pop(context, calendarController.selectedMovieDate.value);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        color: isSelected ? MyTheme.splash : const Color(0xfff8f8f8),
                      ),
                      child: Center(
                        child: Text(
                          format.format(calendarController.nextWeek[index - 1]),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
