class StudentModel{
  int stuID;
  String studentName;
  String?  educationLevel;
  int?     age;
  String?  fatherPhone;
  String?  homePhone;
  int?  partCount;
  int?  registrationYear;
  int halaqa_id;

  StudentModel({
    required this.stuID,
    required this.studentName,
   this.educationLevel,
    this.age,
     this.fatherPhone,
     this.homePhone,
     this.partCount,
     this.registrationYear,
    required this.halaqa_id
  });

  factory StudentModel.fromMap(Map<String,dynamic> data){
    return StudentModel(
        stuID: data['stu_id'],
        studentName: data['student_name'],
        educationLevel: data['education_level'],
        age: data['age'],
        fatherPhone: data['father_phone'],
        homePhone: data['home_phone'],
        partCount: data['part_count'],
        registrationYear: data['registration_year'],
        halaqa_id: data['halaqa_id']);
  }



}