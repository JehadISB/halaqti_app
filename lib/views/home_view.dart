import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_navigation_bar.dart';
import 'package:halaqti_app/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: KSecondryColor,
      appBar: CustomAppBar(),
      body: SafeArea(
        child: HomeViewBody(),
      ),
      bottomNavigationBar: CusotmBottomNavigationBar(),
    );
  }
}
