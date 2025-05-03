import 'package:flutter/material.dart';
import 'package:halaqti_app/constants/colors.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/models/student_model.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_dialog_widget.dart';
import 'package:halaqti_app/widgets/custom_snackbar.dart';
import 'package:halaqti_app/widgets/custom_text_form_field.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

SqlDb sqlDb=SqlDb();
class addStudentAlertDialogBody extends StatefulWidget {

  const addStudentAlertDialogBody({
    super.key,
    required this.textBtn,
    this.color,
  });
  final String textBtn;
  final Color? color;


  @override
  State<addStudentAlertDialogBody> createState() => _addStudentAlertDialogBodyState();
}

class _addStudentAlertDialogBodyState extends State<addStudentAlertDialogBody> {
  final formKey= GlobalKey<FormState>();
  final TextEditingController studentNameController= TextEditingController();
  final TextEditingController educationLevelController= TextEditingController();
  final TextEditingController ageController= TextEditingController();
  final TextEditingController fatherPoneController= TextEditingController();
  final TextEditingController homePhoneController= TextEditingController();
  final TextEditingController partCountController= TextEditingController();
  final TextEditingController registrationYearController= TextEditingController();
   String? studentName;
   String?  educationLevel;
   int?     age;
   String?  fatherPhone;
   String?  homePhone;
   int?  partCount;
   int?  registrationYear;

   void submitForm(){
     if(formKey.currentState!.validate()){
       studentName=studentNameController.text.trim();
       educationLevel=educationLevelController.text.trim();
       age = ageController.text.trim().isNotEmpty ? int.parse(ageController.text.trim()) : 0;
       fatherPhone=fatherPoneController.text.trim();
       homePhone=homePhoneController.text.trim();
       partCount = partCountController.text.trim().isNotEmpty ? int.parse(partCountController.text.trim()) : 0;
       registrationYear = registrationYearController.text.trim().isNotEmpty ? int.parse(registrationYearController.text.trim()) : 0;
       insertToDatabase();
       Navigator.pop(context);
       customShowSnackBar(context,message: '✅  تم إضافة الطالب بنجاح',backgroundColor: KDoneColor);
     }else{
       showDialog(context: context, builder: (context)=>CustomDialogWidget(
         title: "فضلا",
         subtitle: "املأ الحقول الفارغة",

       ));
     }
   }
  insertToDatabase(){
     print("BEFORE===('$studentName','$educationLevel','$age','$fatherPhone','$homePhone','$partCount','$registrationYear',1)");
    sqlDb.insertData("""INSERT INTO student (student_name,education_level,age,father_phone,home_phone,part_count,registration_year,halaqa_id)
     VALUES ('$studentName','$educationLevel','$age','$fatherPhone','$homePhone','$partCount','$registrationYear',1)""");
     print("AFTER====('$studentName','$educationLevel','$age','$fatherPhone','$homePhone','$partCount','$registrationYear',1)");
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: (MediaQuery.of(context).size.height) * 0.5,

      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(),
              CustomTextFormField(
                icon: Icons.person,colorIcon: KMainColor,
                hintText: "اسم الطالب",
                controller:studentNameController ,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'الرجاء إدخال الاسم';
                  }
                  if (!RegExp(r'^[a-zA-Z\u0621-\u064A\u066E\u066F\u0671-\u06D3 ]+$').hasMatch(value.trim())){
                    return 'غير مسموح بالرموز والأرقام';
                  }
                  return null;
                },
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.school,colorIcon: KMainColor,
                hintText: "المرحلة الدراسية",
                 controller: educationLevelController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.event,colorIcon: KMainColor,
                hintText: "العمر",
                keyboardType: TextInputType.number,
                 controller: ageController,
                 validator: (value) {
                   if (value == null || value.trim().isEmpty) {
                     return null;
                   }
                   if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                     return 'مسموح بالأرقام فقط';
                   }
                   return null;
                 },
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.contact_phone,colorIcon: KMainColor,
                hintText: "جوال ولي الأمر",
                keyboardType: TextInputType.number,
                 controller: fatherPoneController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.call,colorIcon: KMainColor,
                hintText: "هاتف المنزل",
                keyboardType: TextInputType.number,
                 controller: homePhoneController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.auto_stories,colorIcon: KMainColor,
                hintText: "عدد الأجزاء",
                keyboardType: TextInputType.number,
                controller:partCountController ,
                 validator: (value) {
                   if (value == null || value.trim().isEmpty) {
                     return null;
                   }
                   if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                     return 'مسموح بالأرقام فقط';
                   }
                   return null;
                 },
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.calendar_month,colorIcon: KMainColor,
                hintText: "سنة التسجيل",
                keyboardType: TextInputType.datetime,
                 controller: registrationYearController,
                 validator: (value) {
                   if (value == null || value.trim().isEmpty) {
                     return null;
                   }
                   if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
                     return 'مسموح بالأرقام فقط';
                   }
                   return null;
                 },
              ),
              CustomVerticalSize(),
              // const Spacer(),
              CustomButton(
                text: widget.textBtn,
                color: widget.color,
                onTap: (){
                  submitForm();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
