import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              onSaved: (value) => _password = value,
              obscureText: true,
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () async {
                _formKey.currentState?.save();
                // Implement login logic here
                final success =
                    await DatabaseHelper.instance.login(_email!, _password!);
                if (success) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  // Show login failed message
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Login Failed')));
                }
              },
            ),
            TextButton(
              child: Text('Register New Account'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Welcome! You are now logged in.'),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String? _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (value) => _name = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onSaved: (value) => _email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              onSaved: (value) => _password = value,
              obscureText: true,
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () async {
                _formKey.currentState?.save();
                // Implement registration logic here
                final success = await DatabaseHelper.instance
                    .register(_name!, _email!, _password!);
                if (success) {
                  Navigator.pop(context);
                } else {
                  // Show registration failed message
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration Failed')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DatabaseHelper {
  static final _databaseName = "myApp.db";
  static final _databaseVersion = 1;
  static final table = 'users';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnEmail = 'email';
  static final columnPassword = 'password';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  _initializeDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
         CREATE TABLE $table (
           $columnId INTEGER PRIMARY KEY,
           $columnName TEXT NOT NULL,
           $columnEmail TEXT NOT NULL,
           $columnPassword TEXT NOT NULL
         )
         ''');
  }

  Future<bool> register(String name, String email, String password) async {
    Database db = await instance.database;
    var user =
        await db.query(table, where: "$columnEmail = ?", whereArgs: [email]);
    if (user.isNotEmpty) return false; // User already exists
    await db.insert(table,
        {columnName: name, columnEmail: email, columnPassword: password});
    return true;
  }

  Future<bool> login(String email, String password) async {
    Database db = await instance.database;
    var user = await db.query(table,
        where: "$columnEmail = ? AND $columnPassword = ?",
        whereArgs: [email, password]);
    return user.isNotEmpty;
  }
}
