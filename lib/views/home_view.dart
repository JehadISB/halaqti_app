import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hlaqati app"),
        backgroundColor: Colors.cyan[100],
      ),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 240,
          child: CarouselView(
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
              })),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          height: 200,
          decoration: BoxDecoration(
              color: Colors.cyan[100],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    color: Colors.cyanAccent,
                  );
                }),
          ),
        ),
      ],
    );
  }
}
