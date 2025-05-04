import 'package:flutter/material.dart';

class Student {
  String name;
  String status;

  Student({required this.name, this.status = 'غائب'});
}

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<String> statuses = ['حاضر', 'غائب', 'متأخر', 'غائب بعذر'];

  List<Student> students = [
    Student(name: 'أحمد'),
    Student(name: 'خالد'),
    Student(name: 'سارة'),
  ];

  void cycleStatus(int index) {
    setState(() {
      final currentIndex = statuses.indexOf(students[index].status);
      final nextIndex = (currentIndex + 1) % statuses.length;
      students[index].status = statuses[nextIndex];
    });
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'حاضر':
        return Colors.green;
      case 'غائب':
        return Colors.red;
      case 'متأخر':
        return Colors.orange;
      case 'غائب بعذر':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تحضير الطلاب')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return ListTile(
            title: Text(student.name),
            trailing: GestureDetector(
              onTap: () => cycleStatus(index),
              child: CircleAvatar(
                backgroundColor: getStatusColor(student.status),
                child: Text(
                  student.status,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                radius: 30,
              ),
            ),
          );
        },
      ),
    );
  }
}
