import 'package:flutter/material.dart';
import 'package:course_10_3/db/database.dart';
import 'package:course_10_3/model/student.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Демо SQLite CRUD',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
      ),
      home: StudentPage(),
    );
  }
}

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  final _studentNameController = TextEditingController();
  late Future<List<Student>> _studentsList;
  late String _studentName;
  bool isUpdate = false;
  int? studentIdForUpdate;

  @override
  void initState() {
    super.initState();
    updateStudentList();
  }

  updateStudentList() {
    setState(() {
      _studentsList = DBProvider.db.getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Демо SQLite CRUD'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Form(
            key: _formStateKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Введите имя студента';
                      }
                      if (value.trim() == "")
                        return "Одни пробелы недопустимы!";
                      return null;
                    },
                    onSaved: (value) {
                      _studentName = value!;
                    },
                    controller: _studentNameController,
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.deepOrange,
                            width: 2,
                            style: BorderStyle.solid),
                      ),
                      labelText: "Имя студента",
                      icon: Icon(
                        Icons.people,
                        color: Colors.teal,
                      ),
                      labelStyle: TextStyle(
                        color: Colors.teal.shade800,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  (isUpdate ? 'ОБНОВИТЬ' : 'ДОБАВИТЬ'),
                ),
                onPressed: () async {
                  if (_formStateKey.currentState!.validate()) {
                    _formStateKey.currentState!.save();
                    if (isUpdate) {
                      await DBProvider.db.updateStudent(
                          Student(studentIdForUpdate!, _studentName));
                      isUpdate = false;
                    } else {
                      await DBProvider.db
                          .insertStudent(Student(null, _studentName));
                    }
                  }
                  _studentNameController.text = '';
                  updateStudentList();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  (isUpdate ? 'ОТМЕНИТЬ ОБНОВЛЕНИЕ' : 'ОЧИСТИТЬ'),
                ),
                onPressed: () {
                  _studentNameController.text = '';
                  setState(() {
                    isUpdate = false;
                    studentIdForUpdate = null;
                  });
                },
              ),
            ],
          ),
          Divider(
            height: 5.0,
            color: Colors.teal,
          ),
          Expanded(
            child: FutureBuilder<List<Student>>(
              future: _studentsList,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(child: CircularProgressIndicator());
                }
                final students = snapshot.data ?? [];
                if (students.isEmpty) {
                  return Center(child: Text('Данные не найдены'));
                }
                return generateList(students);
              },
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView generateList(List<Student> students) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: DataTable(
          headingTextStyle: TextStyle(
            color: Colors.teal.shade800,
            fontWeight: FontWeight.bold,
          ),
          columns: [
            DataColumn(
              label: Text('ИМЯ'),
            ),
            DataColumn(
              label: Text('УДАЛИТЬ'),
            ),
          ],
          rows: students
              .map(
                (student) => DataRow(cells: [
                  DataCell(Text(student.name), onTap: () {
                    setState(() {
                      isUpdate = true;
                      studentIdForUpdate = student.id;
                    });
                    _studentNameController.text = student.name;
                  }),
                  DataCell(
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.deepOrange),
                      onPressed: () async {
                        await DBProvider.db.deleteStudent(student.id);
                        updateStudentList();
                      },
                    ),
                  ),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}