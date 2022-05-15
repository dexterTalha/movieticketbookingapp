import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieticketbookingapp/model/seat_layout_model.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;
  SeatLayout({Key? key, required this.model}) : super(key: key);
  int alphabetCounter = -1;
  int seatCounter = 0;
  @override
  Widget build(BuildContext context) {
    int seatLength = model.seatTypes.length;
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/screen_here.svg"),
          const Text("Screen Here"),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: seatLength,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "\u20B9 ${model.seatTypes[seatLength - index - 1]['price']} ${model.seatTypes[seatLength - index - 1]['title']}"),
                        const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          model.rowBreaks[index],
                          (row) {
                            alphabetCounter++;
                            seatCounter = 0;
                            return Wrap(
                              children: List.generate(
                                model.cols,
                                (col) {
                                  if (col == 0) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: SizedBox(
                                        child: Text(String.fromCharCode(65 + alphabetCounter)),
                                        height: 20,
                                        width: 20,
                                      ),
                                    );
                                  }
                                  //making gaps
                                  //making last row filled
                                  if ((col == model.gapColIndex || col == model.gapColIndex + model.gap - 1) &&
                                      (row != model.rowBreaks[index] - 1 && model.isLastFilled)) {
                                    return Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 20,
                                        width: 20,
                                      ),
                                    );
                                  }

                                  //numbering the seats
                                  seatCounter++;
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      child: Center(child: Text("$seatCounter")),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2.0),
                                        color: const Color(0xffffffff),
                                        border: Border.all(width: 0.5, color: const Color(0xff707070)),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
