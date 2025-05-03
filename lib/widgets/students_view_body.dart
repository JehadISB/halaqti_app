import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/models/student_model.dart';
import 'package:halaqti_app/widgets/add_student_alert_dialog_body.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';
import 'package:halaqti_app/widgets/update_student_alert_dialog_body.dart';

class StudentsViewBody extends StatefulWidget {
  const StudentsViewBody({
    super.key,
  });

  @override
  State<StudentsViewBody> createState() => _StudentsViewBodyState();
}

class _StudentsViewBodyState extends State<StudentsViewBody> {
  SqlDb sqlDb=SqlDb();
  List<StudentModel> studentModel=[];

  Future<List<StudentModel>> getStudentsFromDatabase() async{
    List<Map<String,dynamic>> data= await sqlDb.readData("SELECT * FROM student");
    if(data.isNotEmpty){
      studentModel=data.map((student)=>StudentModel.fromMap(student)).toList();
    }
    return studentModel;
  }

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        //const CustomVerticalSize(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children: [
        //     DropdownButton(items: const [
        //       DropdownMenuItem(
        //         value: "halaqaName",
        //         child: Text("اسم الحلقة"),
        //       )
        //     ], onChanged: null),
        //     DropdownButton(items: const [
        //       DropdownMenuItem(
        //         value: "teacherName",
        //         child: Text("اسم المعلم"),
        //       )
        //     ], onChanged: null),
        //   ],
        // ),
        const CustomVerticalSize(height: 8,),
        // const Divider(),
        Expanded(

          child: FutureBuilder<List<StudentModel>>(
            future: getStudentsFromDatabase(),
            builder: (context, snapshot) {
              final students=snapshot.data??[];
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(color: KMainColor,strokeAlign: 6,));
              }
              if(snapshot.hasError){
                return Center(child: Text("حدث خطأ أثناء عرض أسماء الطلاب ، يرجى إعادة المحاولة",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,));
              }
              if(students.isEmpty){
                return Center(child: Text("لا يوجد طلاب حاليا ، يرجى إضافة طالب",style: TextStyle(fontSize: 18),textAlign: TextAlign.center,));
              }
              return ListView.separated(
                itemCount: students.length,
    itemBuilder: (BuildContext context, int index) {
             return ListTile(
                  title: Text(students[index].studentName),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("تعديل بيانات طالب"),
                              content: UpdateStudentAlertDialogBody(
                                student: students[index],
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

              );
            },

          ),
        )
      ],
    );
  }


}
