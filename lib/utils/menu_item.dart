import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 10, left: 20.0, right: 10),
            child: GestureDetector(
              onTap: () {
                print(menus[i].name);
              },
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      menus[i].asset,
                      height: 35,
                      width: 35,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    menus[i].name,
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
