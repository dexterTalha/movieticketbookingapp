import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movieticketbookingapp/controllers/seat_selection_controller.dart';
import 'package:movieticketbookingapp/model/movie_model.dart';
import 'package:movieticketbookingapp/model/theatre_model.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';
import 'package:movieticketbookingapp/widgets/no_of_seats.dart';
import 'package:movieticketbookingapp/widgets/seat_layout.dart';
import 'package:movieticketbookingapp/widgets/seat_type.dart';
import 'package:movieticketbookingapp/widgets/theatre_block.dart';

import '../utils/dummy_data.dart';

class SeatSelectionScreen extends StatefulWidget {
  final TheatreModel theatreModel;
  final MovieModel movieModel;
  const SeatSelectionScreen({
    Key? key,
    required this.theatreModel,
    required this.movieModel,
  }) : super(key: key);

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  noOfSeatSelection() {
    return Expanded(
      child: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "How Many Seats?",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  child: SvgPicture.asset(
                    "assets/icons/${SeatSelectionController.instance.getAsset()}",
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              NoOfSeats(onTap: SeatSelectionController.instance.noOfSeats),
              const SizedBox(
                height: 10,
              ),
              SeatType(
                onTap: SeatSelectionController.instance.seatType,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomBar({required Function(bool) toggle}) {
    return BottomAppBar(
      child: SizedBox(
        height: AppBar().preferredSize.height,
        child: ElevatedButton(
          onPressed: () {
            print(SeatSelectionController.instance.isSeatSelection.value);
            toggle(!SeatSelectionController.instance.isSeatSelection.value);
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: MyTheme.splash,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          child: const Center(
            child: Text(
              "Select Seats",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomBar(toggle: SeatSelectionController.instance.isSeatSelection),
      backgroundColor: const Color(0xFFF5F5FA),
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.movieModel.title),
        actions: [],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TheatreBlock(
            model: widget.theatreModel,
            onTimeTap: SeatSelectionController.instance.timeSelectedIndex,
            isBooking: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(() => SeatSelectionController.instance.isSeatSelection.value
              ? SeatLayout(model: seatLayout)
              : noOfSeatSelection()),
        ],
      ),
    );
  }
}
