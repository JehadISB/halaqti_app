import 'package:flutter/material.dart';
import 'package:halaqti_app/database/sqlDb.dart';
import 'package:halaqti_app/models/student_model.dart';

class ListAttendanceStudents extends StatefulWidget {
  const ListAttendanceStudents({
    super.key, required this.studentsList,
  });
  final List<StudentModel>? studentsList;

  @override
  State<ListAttendanceStudents> createState() => _ListAttendanceStudentsState();
}
class _ListAttendanceStudentsState extends State<ListAttendanceStudents> {
  final SqlDb sqlDb = SqlDb();

  final List<String> statuses = ['حاضر', 'غائب', 'متأخر', 'غائب بعذر'];
  final Map<int, String> studentStatuses = {}; // stu_id -> status

  @override
  void initState() {
    super.initState();
    _loadAttendanceStatuses();
  }

  Future<void> _loadAttendanceStatuses() async {
    final today = DateTime.now().toIso8601String().split('T').first;

    for (var student in widget.studentsList!) {
      final result = await sqlDb.readData("""
        SELECT status FROM attendance 
        WHERE student_id = ${student.stuID} AND date = '$today'
      """);

      if (result.isNotEmpty) {
        studentStatuses[student.stuID] = result.first['status'];
      } else {
        studentStatuses[student.stuID] = 'غائب'; // default
      }
    }
    setState(() {});
  }

  Future<void> _cycleStatus(int studentId, int halaqaId) async {
    String currentStatus = studentStatuses[studentId] ?? 'غائب';
    int currentIndex = statuses.indexOf(currentStatus);
    int nextIndex = (currentIndex + 1) % statuses.length;
    String newStatus = statuses[nextIndex];

    final today = DateTime.now().toIso8601String().split('T').first;

    // Check if entry exists
    final existing = await sqlDb.readData("""
      SELECT * FROM attendance 
      WHERE student_id = $studentId AND date = '$today'
    """);

    if (existing.isNotEmpty) {
      await sqlDb.updateData("""
        UPDATE attendance 
        SET status = '$newStatus' 
        WHERE student_id = $studentId AND date = '$today'
      """);
    } else {
      await sqlDb.insertData("""
        INSERT INTO attendance (student_id, halaqa_id, date, status)
        VALUES ($studentId, $halaqaId, '$today', '$newStatus')
      """);
    }

    setState(() {
      studentStatuses[studentId] = newStatus;
    });
  }

  Color _getStatusColor(String status) {
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
    return ListView.separated(
      itemCount: widget.studentsList!.length,
      itemBuilder: (context, index) {
        final student = widget.studentsList![index];
        final status = studentStatuses[student.stuID] ?? '...';

        return ListTile(
          title: Text(student.studentName),
          trailing: GestureDetector(
            onTap: () {
              _cycleStatus(student.stuID, student.halaqa_id);
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: _getStatusColor(status),
              child: Text(
                status,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}

//================
//
// class _ListAttendanceStudentsState extends State<ListAttendanceStudents> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemCount: widget.studentsList!.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           titleAlignment: ListTileTitleAlignment.bottom,
//           trailing: SizedBox(
//             height: 60,
//             width: 60,
//             child: IconButton(
//               onPressed: () {
//
//               },
//               icon: const Icon(Icons.circle,),
//
//               iconSize: 60,
//             ),
//           ),
//           title: Text(widget.studentsList![index].studentName),
//         );
//       },
//       separatorBuilder: (BuildContext context, int index) => const Divider(),
//     );
//
//
//
//   }
// }
