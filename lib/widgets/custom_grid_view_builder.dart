import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder({
    super.key,
    required this.crossAxisCount,
    this.mainAxisSpacing = 0.0,
    this.crossAxisSpacing = 0.0,
    this.mainAxisExtent,
    this.itemCount,
    required this.cardTitle,
    this.color,
  });
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double? mainAxisExtent;
  final int? itemCount;
  final String cardTitle;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisExtent: mainAxisExtent,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            color: color ?? KMainColor,
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.network(
                    "https://tajalquran.com/store/1/koran-holy-book-muslims_44074-2686.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(child: Text(cardTitle))
              ],
            ),
          );
        });
  }
}
