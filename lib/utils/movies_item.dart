import 'package:flutter/material.dart';
import 'package:movieticketbookingapp/utils/dummy_data.dart';
import 'package:movieticketbookingapp/utils/mytheme.dart';
import 'package:movieticketbookingapp/widgets/item_block.dart';

class MoviesItems extends StatelessWidget {
  const MoviesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: 230,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (_, i) {
          return ItemBlock(
            model: movies[i],
            isMovie: true,
          );
        },
      ),
    );
  }
}
