import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/widgets/custom_alert_dialog_body.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class StudentsViewBody extends StatelessWidget {
  const StudentsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomVerticalSize(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DropdownButton(items: const [
              DropdownMenuItem(
                value: "halaqaName",
                child: Text("اسم الحلقة"),
              )
            ], onChanged: null),
            DropdownButton(items: const [
              DropdownMenuItem(
                value: "teacherName",
                child: Text("اسم المعلم"),
              )
            ], onChanged: null),
          ],
        ),
        const CustomVerticalSize(),
        const Divider(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text("اسم الطالب"),
                trailing: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Text("تعديل بيانات طالب"),
                            content: CustomAlertDialogBody(
                              textBtn: "تعديل",
                              color: KSecondryColor,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      color: Colors.amber,
                    ),
                    const IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
