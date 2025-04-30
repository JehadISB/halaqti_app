import 'package:flutter/material.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/widgets/custom_button.dart';
import 'package:halaqti_app/widgets/custom_snackbar.dart';
import 'package:halaqti_app/widgets/custom_text_form_field.dart';
import 'package:halaqti_app/widgets/custom_vertical_size.dart';

SqlDb sqlDb=SqlDb();
class CustomAlertDialogBody extends StatefulWidget {

  const CustomAlertDialogBody({
    super.key,
    required this.textBtn,
    this.color,
  });
  final String textBtn;
  final Color? color;


  @override
  State<CustomAlertDialogBody> createState() => _CustomAlertDialogBodyState();
}

class _CustomAlertDialogBodyState extends State<CustomAlertDialogBody> {
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
       age=int.parse(ageController.text.trim());
       fatherPhone=fatherPoneController.text.trim();
       homePhone=homePhoneController.text.trim();
       partCount=int.parse(partCountController.text.trim());
       registrationYear=int.parse(registrationYearController.text.trim());
       insertToDatabase();
       Navigator.pop(context);
       customShowSnackBar(context,message: 'تم إضافة طالب بنجاح ✅');

     }else{
       customShowSnackBar(context,message: 'فضلا، املأ الحقول الفارغة ⛔');
     }
   }
  insertToDatabase(){
    sqlDb.insertData("INSERT INTO students (student_name,education_level,age,father_phone,home_phone,part_count,registration_year,halaqa_id) VALUES ('$studentName','$educationLevel','$age','$fatherPhone','$homePhone','$partCount','$registrationYear',)");
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
                icon: Icons.person,
                hintText: "اسم الطالب",
                controller:studentNameController ,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.school,
                hintText: "المرحلة الدراسية",
                 controller: educationLevelController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.event,
                hintText: "العمر",
                keyboardType: TextInputType.number,
                 controller: ageController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.contact_phone,
                hintText: "جوال ولي الأمر",
                keyboardType: TextInputType.number,
                 controller: fatherPoneController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.call,
                hintText: "هاتف المنزل",
                keyboardType: TextInputType.number,
                 controller: homePhoneController,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.auto_stories,
                hintText: "عدد الأجزاء",
                keyboardType: TextInputType.number,
                controller:partCountController ,
              ),
              CustomVerticalSize(),
               CustomTextFormField(
                icon: Icons.calendar_month,
                hintText: "سنة التسجيل",
                keyboardType: TextInputType.datetime,
                 controller: registrationYearController,
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
