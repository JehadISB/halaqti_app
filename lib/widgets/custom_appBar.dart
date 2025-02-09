import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);

  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("hlaqati app"),
      backgroundColor: KMainColor,
    );
  }
}
