import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieticketbookingapp/controllers/common_controller.dart';

import 'package:movieticketbookingapp/utils/dummy_data.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';

class ScreenSelectionBlock extends StatelessWidget {
  Function(String) onScreenSelect;
  ScreenSelectionBlock({
    Key? key,
    required this.onScreenSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CommonController controller = CommonController.instance;
    return Container(
      height: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Tamil ${controller.screen.value}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: List.generate(screens.length, (index) {
                bool isSelected = controller.screen.value == screens[index];
                return GestureDetector(
                  onTap: () {
                    onScreenSelect(screens[index]);
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isSelected ? MyTheme.splash : MyTheme.greyColor,
                      ),
                      padding: const EdgeInsets.all(5),
                      child: Center(
                        child: Text(
                          screens[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
