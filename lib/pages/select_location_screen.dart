import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:movieticketbookingapp/controllers/location_controller.dart';
import 'package:movieticketbookingapp/pages/home_screen.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';
import 'package:loading_overlay/loading_overlay.dart';

class SelectionLocationScreen extends StatefulWidget {
  const SelectionLocationScreen({Key? key}) : super(key: key);

  @override
  State<SelectionLocationScreen> createState() => _SelectionLocationScreenState();
}

class _SelectionLocationScreenState extends State<SelectionLocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  var myLocationWidget = Padding(
    padding: const EdgeInsets.only(top: 20),
    child: GestureDetector(
      onTap: () async {
        LocationController.instance.isLocating(true);
        await LocationController.instance.getLocation();

        Get.offAll(() => HomeScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.greyColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.my_location,
              color: Colors.black45,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "My Current Location",
              style: TextStyle(color: Colors.black45, fontSize: 16),
            ),
          ],
        ),
      ),
    ),
  );

  Widget suggestedLocation(String city) => Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black45, width: 1),
        ),
        child: Center(
          child: Text(
            city,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Obx(
            () {
              return LoadingOverlay(
                isLoading: LocationController.instance.isLocating.value,
                color: MyTheme.statusBar,
                progressIndicator: const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(MyTheme.appBarColor),
                ),
                opacity: 0.3,
                child: Container(
                  height: size.height,
                  width: size.width,
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myLocationWidget,
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: cities.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: constraints.maxWidth > 680 ? 5 : 3,
                            childAspectRatio: 2.3,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                          ),
                          itemBuilder: (_, index) => GestureDetector(
                            onTap: () {
                              LocationController.instance.setCity(cities[index]);
                              Get.offAll(() => const HomeScreen());
                            },
                            child: suggestedLocation(
                              cities[index],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Search",
                            prefixIconConstraints: const BoxConstraints(
                              maxHeight: 50,
                              maxWidth: 50,
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: SvgPicture.asset(
                                "assets/icons/search.svg",
                                color: Colors.black45,
                              ),
                            ),
                            hintStyle: const TextStyle(color: Colors.black45),
                            fillColor: MyTheme.greyColor,
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
