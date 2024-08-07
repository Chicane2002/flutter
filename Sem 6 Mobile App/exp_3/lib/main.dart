// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Database _database;
  TextEditingController _rollNumberController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _gradeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'students.db');

    // Open the database
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Create the table
      await db.execute(
          'CREATE TABLE Students (rollNumber INTEGER PRIMARY KEY, name TEXT, grade TEXT)');
    });
  }

  Future<void> _insertStudent() async {
    int rollNumber = int.tryParse(_rollNumberController.text) ?? 0;
    String name = _nameController.text;
    String grade = _gradeController.text;

    if (rollNumber > 0 && name.isNotEmpty && grade.isNotEmpty) {
      await _database.transaction((txn) async {
        int id = await txn.rawInsert(
            'INSERT INTO Students(rollNumber, name, grade) VALUES(?, ?, ?)',
            [rollNumber, name, grade]);
        print('Inserted student record with id: $id');
        _rollNumberController.clear();
        _nameController.clear();
        _gradeController.clear();
      });
    }
  }

  Future<Map<String, dynamic>> _searchStudent(int rollNumber) async {
    List<Map<String, dynamic>> results = await _database
        .rawQuery('SELECT * FROM Students WHERE rollNumber = ?', [rollNumber]);

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {}; // Return an empty map if no student found
    }
  }

  Future<void> _updateStudent(
      int rollNumber, String newName, String newGrade) async {
    int count = await _database.rawUpdate(
        'UPDATE Students SET name = ?, grade = ? WHERE rollNumber = ?',
        [newName, newGrade, rollNumber]);
    print('Updated $count student records');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Database'),
      ),
      body: Center(
        child: SizedBox(
          width: 800,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    TextField(
                      controller: _rollNumberController,
                      decoration:
                          const InputDecoration(labelText: 'Roll Number'),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _gradeController,
                      decoration: const InputDecoration(labelText: 'Grade'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _insertStudent,
                      child: const Text('Insert Student'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        int rollNumber =
                            int.tryParse(_rollNumberController.text) ?? 0;
                        Map<String, dynamic> student =
                            await _searchStudent(rollNumber);
                        if (student.isNotEmpty) {
                          _nameController.text = student['name'];
                          _gradeController.text = student['grade'];
                        } else {
                          _nameController
                              .clear(); // Clear text fields if student not found
                          _gradeController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Student not found for roll number $rollNumber')));
                        }
                      },
                      child: const Text('Search Student'),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        int rollNumber =
                            int.tryParse(_rollNumberController.text) ?? 0;
                        String newName = _nameController.text;
                        String newGrade = _gradeController.text;
                        await _updateStudent(rollNumber, newName, newGrade);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Student record updated')));
                      },
                      child: const Text('Update Student'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
