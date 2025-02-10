import 'package:flutter/material.dart';

class ListAttendanceStudents extends StatelessWidget {
  const ListAttendanceStudents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          titleAlignment: ListTileTitleAlignment.bottom,
          trailing: SizedBox(
            height: 60,
            width: 60,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.circle),
              iconSize: 60,
            ),
          ),
          title: const Text("اسم الطالب"),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
