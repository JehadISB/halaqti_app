import 'package:flutter/material.dart';

class CustomCarouselView extends StatelessWidget {
  const CustomCarouselView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselView(
        itemSnapping: true,
        elevation: 4,
        padding: EdgeInsets.all(8),
        itemExtent: MediaQuery.of(context).size.width - 32,
        children: List.generate(8, (int index) {
          return Container(
            color: Colors.amber,
            child: Image.network(
              "https://tajalquran.com/store/1/koran-holy-book-muslims_44074-2686.jpg",
              fit: BoxFit.cover,
            ),
          );
        }));
  }
}
