import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/models/student_model.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_horizontal_size.dart';
import 'package:halaqti_app/widgets/custom_snackbar.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class DeleteStudentDialogBody extends StatelessWidget {
  const DeleteStudentDialogBody({super.key, required this.title, required this.subtitle, required this.student});
  final String title;
  final String subtitle;
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/cross_mark_error.png",width: 72,),
            const CustomVerticalSize(height: 10,),
            Text(title,style: const TextStyle(fontSize: 24,color: Colors.red,),),
            const CustomVerticalSize(),
            Text(subtitle,style: const TextStyle(fontSize: 16),),
            const CustomVerticalSize(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32
                    ),
                    foregroundColor: KErrorColor,
                    side: const BorderSide(color:KErrorColor,),

                  ),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: const Text("إلغاء"),),
                const CustomHorizontalSize(width: 30,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: KErrorColor,
                    foregroundColor: KBackgroundColor,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32
                    )
                  ),
                  onPressed: () async {
                    if(await deleteStudentFormDatabase(studentId: student.stuID)){
                      Navigator.pop(context);
                      return customShowSnackBar(context, message: "✅  تم حذف الطالب بنجاح",backgroundColor:KErrorColor );
                    }
                  },
                  child: const Text("حذف"),
                ),
              ],
              
            ),
            const CustomVerticalSize(height: 10,),

          ],
        ),
      ),
    );
  }

  Future<bool> deleteStudentFormDatabase({required int studentId})async {
    SqlDb sqlDb=SqlDb();
    int response = await sqlDb.deleteData("DELETE FROM student WHERE stu_id = $studentId");
    if (response > 0) {
      return true;
    } else {
      return false;
    }

  }
}
