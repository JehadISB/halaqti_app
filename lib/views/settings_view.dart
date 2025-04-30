import 'package:flutter/material.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/widgets/custom_appBar.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_drawer.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';


class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    SqlDb sqlDb = SqlDb();
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          CustomVerticalSize(),
          CustomButton(text: "إضافة مسجد", onTap: () {
            sqlDb.insertData("INSERT INTO masjid (masjid_name,location) VALUES ('سيئون','جامع الإمام الشافعي')");
          },),
          CustomVerticalSize(),
          CustomButton(text: "إضافة معلم",onTap: (){
            sqlDb.insertData("INSERT INTO teacher (teacher_name, phone) VALUES ('Jehad', '779842865')");
          },),
          CustomVerticalSize(),
          CustomButton(text: "إضافة حلقة",onTap: (){
            sqlDb.insertData("INSERT INTO halaqa (halaqa_name, teacher_id, masjid_id) VALUES ('The-hero', 1,1)");

          },),

        ],),
    );
  }
}