import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Демо общих настроек',
      theme: ThemeData(
        colorSchemeSeed: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
      ),
      home: SharedPrefereceExample(),
    );
  }
}

class SharedPrefereceExample extends StatefulWidget {
  @override
  _SharedPrefereceExampleState createState() => _SharedPrefereceExampleState();
}

class _SharedPrefereceExampleState extends State<SharedPrefereceExample> {
  late SharedPreferences _prefs;
  static const String kNumberPrefKey = 'number_pref';
  static const String kBoolPrefKey = 'bool_pref';
  int _numberPref = 0;
  bool _boolPref = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => this._prefs = prefs);
      _loadNumberPref();
      _loadBoolPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(fontSize: 18, color: Colors.teal.shade800);
    return Scaffold(
      appBar: AppBar(
        title: Text('Демо общих настроек'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(children: <Widget>[
                  Text('Числовая настройка', style: textStyle),
                  Text('${this._numberPref}', style: textStyle),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Увеличить'),
                    onPressed: () => this._setNumberPref(this._numberPref + 1),
                  ),
                ]),
                TableRow(children: <Widget>[
                  Text('Логическая настройка', style: textStyle),
                  Text(this._boolPref ? 'Да' : 'Нет', style: textStyle),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('Переключить'),
                    onPressed: () => this._setBoolPref(!this._boolPref),
                  ),
                ]),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade900,
                foregroundColor: Colors.white,
              ),
              child: Text('Сбросить данные'),
              onPressed: () => this._resetDataPref(),
            ),
          ],
        ),
      ),
    );
  }

  Future<Null> _setNumberPref(int value) async {
    await this._prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  Future<Null> _setBoolPref(bool value) async {
    await this._prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

  void _loadNumberPref() {
    setState(() {
      this._numberPref = this._prefs.getInt(kNumberPrefKey) ?? 0;
    });
  }

  void _loadBoolPref() {
    setState(() {
      this._boolPref = this._prefs.getBool(kBoolPrefKey) ?? false;
    });
  }

  Future<Null> _resetDataPref() async {
    await this._prefs.remove(kNumberPrefKey);
    await this._prefs.remove(kBoolPrefKey);
    _loadNumberPref();
    _loadBoolPref();
  }
}