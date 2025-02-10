import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/custom_carousel_view.dart';

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
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            mainAxisExtent: 180),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Card(
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Image.network(
                                "https://tajalquran.com/store/1/koran-holy-book-muslims_44074-2686.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            const Expanded(child: Text("الطلاب"))
                          ],
                        ),
                        color: KMainColor,
                      );
                    }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
