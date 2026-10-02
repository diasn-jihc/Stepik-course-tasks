import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preference Demo',
      home: const SharedPrefereceExample(),
    );
  }
}
class SharedPrefereceExample extends StatefulWidget {
  const SharedPrefereceExample({super.key});
  @override
  State<SharedPrefereceExample> createState() => _SharedPrefereceExampleState();
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
    SharedPreferences.getInstance()
    ..then((prefs) {
      if (!mounted) return;
      setState(() => _prefs = prefs);
      _loadNumberPref();
      _loadBoolPref();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference Demo'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              TableRow(children: <Widget>[
                Text('Number Preference'),
                Text('${_numberPref}'),
                ElevatedButton(
                  child: Text('Increment'),
                  onPressed: () => _setNumberPref(_numberPref + 1),
                ),
              ]),
              TableRow(children: <Widget>[
                Text('Boolean Preference'),
                Text('${_boolPref}'),
                ElevatedButton(
                  child: Text('Toogle'),
                  onPressed: () => _setBoolPref(!_boolPref),
                ),
              ]),
            ],
          ),
          ElevatedButton(
            child: Text('Reset Data'),
            onPressed: () => _resetDataPref(),
          ),
        ],
      ),
    );
  }

  Future<Null> _setNumberPref(int value) async {
    await _prefs.setInt(kNumberPrefKey, value);
    _loadNumberPref();
  }

  Future<Null> _setBoolPref(bool value) async {
    await _prefs.setBool(kBoolPrefKey, value);
    _loadBoolPref();
  }

  void _loadNumberPref() {
    setState(() {
      _numberPref = _prefs.getInt(kNumberPrefKey) ?? 0;
    });
  }
  void _loadBoolPref() {
    setState(() {
      _boolPref = _prefs.getBool(kBoolPrefKey) ?? false;
    });
  }

  Future<Null> _resetDataPref() async {
    await _prefs.remove(kNumberPrefKey);
    await _prefs.remove(kBoolPrefKey);
    _loadNumberPref();
    _loadBoolPref();
  }
}
