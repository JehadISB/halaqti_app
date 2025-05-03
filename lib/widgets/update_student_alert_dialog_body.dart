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
class UpdateStudentAlertDialogBody extends StatefulWidget {

  const UpdateStudentAlertDialogBody({
    super.key,
    required this.textBtn,
    this.color, required this.student,
  });

  final String textBtn;
  final Color? color;
  final StudentModel student;


  @override
  State<UpdateStudentAlertDialogBody> createState() => _UpdateStudentAlertDialogBodyState();
}

class _UpdateStudentAlertDialogBodyState extends State<UpdateStudentAlertDialogBody> {
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
    if(studentNameController.text.trim().isEmpty){
      widget.student.studentName=studentNameController.text.trim();
      widget.student.educationLevel=educationLevelController.text.trim();
      widget.student.age=int.parse(ageController.text.trim());
      widget.student.fatherPhone=fatherPoneController.text.trim();
      widget.student.homePhone=homePhoneController.text.trim();
      widget.student.partCount=int.parse(partCountController.text.trim());
      widget.student.registrationYear=int.parse(registrationYearController.text.trim());
      updateStudentInfo();
      Navigator.pop(context);
      customShowSnackBar(context,message: '✅  تم تعديل بيانات الطالب بنجاح',backgroundColor: KMainColor);

    }else{
      showDialog(context: context, builder: (context)=> CustomDialogWidget(title: "خطأ", subtitle: "يرجى إدخال اسم الطالب"));
    }

  }
  updateStudentInfo(){
    sqlDb.updateData("""INSERT INTO student (student_name,education_level,age,father_phone,home_phone,part_count,registration_year,halaqa_id)
     VALUES ('$studentName','$educationLevel','$age','$fatherPhone','$homePhone','$partCount','$registrationYear',1)""");
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
                hintText: widget.student.studentName,
                controller:studentNameController ,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.school,colorIcon: KMainColor,
                hintText: widget.student.educationLevel??"المرحلة الدراسية",
                controller: educationLevelController,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.event,colorIcon: KMainColor,
                hintText: widget.student.age.toString()?? "العمر",
                keyboardType: TextInputType.number,
                controller: ageController,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.contact_phone,colorIcon: KMainColor,
                hintText:widget.student.fatherPhone?? "جوال ولي الأمر",
                keyboardType: TextInputType.number,
                controller: fatherPoneController,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.call,colorIcon: KMainColor,
                hintText: widget.student.homePhone?? "هاتف المنزل",
                keyboardType: TextInputType.number,
                controller: homePhoneController,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.auto_stories,colorIcon: KMainColor,
                hintText: widget.student.partCount.toString()??"عدد الأجزاء",
                keyboardType: TextInputType.number,
                controller:partCountController ,
              ),
              CustomVerticalSize(),
              CustomTextFormField(
                icon: Icons.calendar_month,colorIcon: KMainColor,
                hintText: widget.student.registrationYear.toString()??"سنة التسجيل",
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
