import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieticketbookingapp/model/seat_layout_model.dart';

class SeatLayout extends StatelessWidget {
  final SeatLayoutModel model;

  const SeatLayout({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int seatTypes = model.seatTypes.length;
    int alphabetCounter = -1;
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              constrained: true,
              panEnabled: true,
              minScale: 0.1,
              maxScale: 4,
              child: ListView.builder(
                itemCount: seatTypes,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "\u20B9 ${model.seatTypes[seatTypes - index - 1]['price']} "
                              "${model.seatTypes[seatTypes - index - 1]['title']}",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ...List.generate(model.rowBreaks[index], (row) {
                            alphabetCounter++;
                            return Wrap(
                              alignment: WrapAlignment.spaceEvenly,
                              children: List.generate(model.cols + 1, (col) {
                                if (col == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: SizedBox(
                                      height: 20,
                                      width: 10,
                                      child: Text(
                                        String.fromCharCode(65 + alphabetCounter),
                                      ),
                                    ),
                                  );
                                }

                                if ((col == model.gapColIndex || col == model.gapColIndex + model.gap - 1) &&
                                    (row != model.rowBreaks[index] - 1 && model.isLastFilled)) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                    ),
                                  );
                                }

                                return Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                    color: Colors.red,
                                    height: 20,
                                    width: 20,
                                  ),
                                );
                              }),
                            );
                          }),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
