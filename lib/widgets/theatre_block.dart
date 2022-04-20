import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:movieticketbookingapp/controllers/location_controller.dart';
import 'package:movieticketbookingapp/model/theatre_model.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';
import 'package:movieticketbookingapp/widgets/facilities_bottom_sheet.dart';

class TheatreBlock extends StatelessWidget {
  final TheatreModel model;
  const TheatreBlock({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model.name,
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.63,
                    ),
                    builder: (_) => FacilitesBottomSheet(model: model),
                  );
                },
                child: Icon(
                  Icons.info_outline,
                  color: Colors.black45.withOpacity(0.3),
                  size: 25,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            text: TextSpan(
              children: [
                const WidgetSpan(
                  child: Icon(
                    Icons.location_on,
                    size: 18,
                    color: Color(0xff999999),
                  ),
                ),
                TextSpan(
                  text: LocationController.instance.city.value + ", ",
                  style: const TextStyle(color: Color(0xff999999)),
                ),
                const TextSpan(
                  text: "2.3km Away",
                  style: TextStyle(color: Color(0xff444444)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 10,
            spacing: 20,
            children: List.generate(
              4,
              (index) {
                //for dummy data
                Color color = index % 2 == 0 ? MyTheme.orangeColor : MyTheme.greenColor;
                return GestureDetector(
                  onTap: () {
                    //to seat selection
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0x22E5E5E5),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        width: 1,
                        color: const Color(0xffE5E5E5),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text(
                      model.timings[index],
                      style: TextStyle(color: color),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
