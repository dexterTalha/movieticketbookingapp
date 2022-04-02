import 'package:flutter/material.dart';

import '../utils/mytheme.dart';

class ItemBlock extends StatelessWidget {
  final dynamic model;
  final bool isMovie;
  final double height;
  final double width;
  const ItemBlock({
    Key? key,
    required this.model,
    this.isMovie = false,
    this.height = 150,
    this.width = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MovieModel? movie = isMovie ? model as MovieModel : null;
    // EventModel? event = !isMovie ? model as EventModel : null;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20.0, right: 10),
      child: GestureDetector(
        onTap: () {
          print(model.title);
        },
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  model.bannerUrl,
                  height: height,
                  width: width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                model.title,
                style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
              ),
              isMovie
                  ? Row(
                      children: [
                        const Icon(
                          Icons.favorite,
                          color: MyTheme.splash,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${model.like}%",
                          style: const TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  : Text(
                      model.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 10),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
