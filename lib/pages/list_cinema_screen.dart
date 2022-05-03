import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:movieticketbookingapp/pages/seat_selection_screen.dart';
import '../controllers/common_controller.dart';
import '../controllers/seat_selection_controller.dart';
import '../utils/screen_selection_block.dart';
import '../utils/custom_calendar.dart';
import '../controllers/calendar_controller.dart';
import '../model/movie_model.dart';
import '../utils/dummy_data.dart';
import '../utils/mytheme.dart';
import '../widgets/theatre_block.dart';

class ListCinemaScreen extends StatefulWidget {
  final MovieModel model;
  const ListCinemaScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<ListCinemaScreen> createState() => _ListCinemaScreenState();
}

class _ListCinemaScreenState extends State<ListCinemaScreen> {
  final DateFormat format = DateFormat("dd MMM");

  final now = DateTime.now();

  String selectedDate = DateFormat("dd MMM").format(DateTime.now());

  String selectedLanguage = "English";

  String selectedScreen = "3D";
  late CalendarController commonController;

  @override
  void initState() {
    commonController = Get.put(CalendarController());
    Get.put(SeatSelectionController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.delete<CalendarController>();
        print(commonController.selectedMovieDate.value);
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5FA),
        bottomNavigationBar: BottomAppBar(
          color: MyTheme.appBarColor,
          elevation: 0,
          child: Container(
            width: double.maxFinite,
            height: AppBar().preferredSize.height,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: StatefulBuilder(
                    builder: (_, setState) {
                      final todayDate = format.format(now);
                      final tomorrowDate = format.format(now.add(const Duration(days: 1)));
                      String text = "";

                      if (selectedDate == todayDate) {
                        text = "Today, ";
                      } else if (selectedDate == tomorrowDate) {
                        text = "Tomorrow, ";
                      } else {
                        text = DateFormat("EEE").format(commonController.selectedMovieDate.value) + ", ";
                      }

                      return ListTile(
                        onTap: () {
                          showModalBottomSheet(
                                  context: context,
                                  builder: (_) => CustomCalendar(),
                                  constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.35))
                              .then((value) => setState(() {
                                    if (value != null) {
                                      selectedDate = format.format(value);
                                    }
                                  }));
                        },
                        horizontalTitleGap: 0,
                        textColor: Colors.white,
                        leading: const Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                        ),
                        title: Text(
                          "$text$selectedDate",
                          style: const TextStyle(fontSize: 14),
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: StatefulBuilder(builder: (context, setState) {
                    return ListTile(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => ScreenSelectionBlock(
                            onScreenSelect: (screen) {
                              CommonController.instance.updateScreen(screen);
                              setState(() => selectedScreen = screen);
                            },
                          ),
                          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.25),
                        );
                      },
                      horizontalTitleGap: 0,
                      textColor: Colors.white,
                      title: Text(
                        "$selectedLanguage, $selectedScreen",
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.model.title),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: TheatreSearchDelegate(widget.model),
                );
              },
              icon: SvgPicture.asset("assets/icons/search.svg"),
            ),
          ],
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: theatres.length,
          itemBuilder: (_, index) {
            return Container(
              padding: EdgeInsets.only(bottom: index != theatres.length - 1 ? 20 : 0),
              child: TheatreBlock(
                model: theatres[index],
                onTimeTap: (index) {
                  Get.to(() => SeatSelectionScreen(theatreModel: theatres[index], movieModel: widget.model));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class TheatreSearchDelegate extends SearchDelegate {
  final MovieModel model;
  TheatreSearchDelegate(this.model);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Container(),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null.toString());
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_close,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? theatres
        : theatres
            .where(
              (element) => element.name.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: suggestionList.length,
      itemBuilder: (_, index) {
        return Container(
          padding: EdgeInsets.only(bottom: index != suggestionList.length - 1 ? 20 : 0),
          child: TheatreBlock(
            model: suggestionList[index],
            onTimeTap: (index) {
              Get.to(() => SeatSelectionScreen(theatreModel: suggestionList[index], movieModel: model));
            },
          ),
        );
      },
    );
  }
}
