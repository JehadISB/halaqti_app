import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/models/student_model.dart';

Future<List<StudentModel>> getStudentsFromDatabase() async{
  SqlDb sqlDb=SqlDb();
  List<StudentModel> studentModel=[];
  List<Map<String,dynamic>> data= await sqlDb.readData("SELECT * FROM student");
  if(data.isNotEmpty){
    studentModel=data.map((student)=>StudentModel.fromMap(student)).toList();
  }
  return studentModel;
}