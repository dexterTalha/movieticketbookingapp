import 'package:flutter/material.dart';

import '../utils/mytheme.dart';

class ItemBlock extends StatelessWidget {
  final dynamic model;
  final bool isMovie;
  final double height;
  final double width;
  final Function(dynamic model) onTap;
  const ItemBlock({
    Key? key,
    required this.model,
    this.isMovie = false,
    this.height = 150,
    this.width = 120,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MovieModel? movie = isMovie ? model as MovieModel : null;
    // EventModel? event = !isMovie ? model as EventModel : null;
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20.0, right: 10),
      child: GestureDetector(
        onTap: () {
          onTap(model);
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
              Container(
                width: width,
                child: Text(
                  model.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.6)),
                ),
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
