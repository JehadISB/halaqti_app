import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/custom_carousel_view.dart';
import 'package:halaqti_app/widgets/custom_grid_view_builder.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 190,
          //width: (MediaQuery.of(context).size.width) * 0.8,
          child: CustomCarouselView(),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            // height: (MediaQuery.of(context).size.height) * 0.4,
            decoration: const BoxDecoration(
                color: KBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: const CustomGridViewBuilder(
                  crossAxisCount: 5,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 5,
                  mainAxisSpacing: 5,
                  cardTitle: "الطلاب",
                  itemCount: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
