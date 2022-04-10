import 'package:flutter/material.dart';
import 'package:movieticketbookingapp/controllers/auth_controller.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';

import '../utils/constants.dart';

class ReviewBlock extends StatelessWidget {
  const ReviewBlock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? picUrl = AuthController.instance.user!.photoURL;
    picUrl = picUrl ?? Constants.dummyAvatar;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "1043 reviews",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Write yours >",
                  style: TextStyle(
                    color: MyTheme.splash,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            leading: CircleAvatar(
              foregroundImage: NetworkImage(
                picUrl,
              ),
            ),
            title: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AuthController.instance.user!.displayName ?? "No Name",
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  const TextSpan(
                    text: "04 April, 2022",
                    style: TextStyle(
                      color: Colors.black45,
                    ),
                  )
                ],
              ),
            ),
            subtitle:
                Text("With all the updates after the last few months the app has improved a lot. Keeps me up to date."),
          ),
        ],
      ),
    );
  }
}
