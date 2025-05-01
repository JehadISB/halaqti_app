import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/widgets/custom_alert_dialog_body.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

class StudentsViewBody extends StatefulWidget {
  const StudentsViewBody({
    super.key,
  });

  @override
  State<StudentsViewBody> createState() => _StudentsViewBodyState();
}

class _StudentsViewBodyState extends State<StudentsViewBody> {
  SqlDb sqlDb=SqlDb();

  Future<List<String>> getStudentsFromDatabase() async{
    List<String>? studentsName=[];
    List<Map> data= await sqlDb.readData("SELECT student_name FROM student");
    print("==========$data==============");
    if(data.isNotEmpty){
      data.forEach((student){
        studentsName.add(student['student_name']);
      });
    }
    return studentsName;
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

          child: FutureBuilder<List<String>>(
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
                  title: Text(students[index]),
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

              );
            },

          ),
        )
      ],
    );
  }


}
