import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GNav(
              iconSize: 20,
              backgroundColor: Colors.white,
              activeColor: Colors.amber,
              tabBackgroundColor: KMainColor,
              gap: 8,
              //===========
              // rippleColor: Colors
              //     .grey[800]!, // tab button ripple color when pressed
              // hoverColor: Colors.grey[700]!, // tab button hover color
              // haptic: true, // haptic feedback
              // tabBorderRadius: 15,
              // tabActiveBorder: Border.all(
              //     color: Colors.black, width: 1), // tab button border
              // tabBorder: Border.all(
              //     color: Colors.grey, width: 1), // tab button border
              // tabShadow: [
              //   BoxShadow(
              //       color: Colors.grey.withOpacity(0.5), blurRadius: 8)
              // ], // tab button shadow
              // curve: Curves.easeOutExpo, // tab animation curves
              // duration:
              //     Duration(milliseconds: 900), // tab animation duration
              // gap: 8, // the tab button gap between icon and text
              // color: Colors.grey[800], // unselected icon color
              // activeColor: Colors.purple, // selected icon and text color
              // iconSize: 24, // tab button icon size
              // tabBackgroundColor: Colors.purple
              //     .withOpacity(0.1), // selected tab background color
              // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              tabs: [
                GButton(icon: Icons.rule),
                GButton(
                  icon: Icons.book,
                  text: "المناهج",
                ),
                GButton(
                  icon: Icons.person_search,
                  text: "تحضير الطلاب",
                ),
                GButton(
                  icon: Icons.home,
                  text: "الرئيسية",
                ),
              ]),
        ),
      ],
    );
  }
}
