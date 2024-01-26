import 'package:flutter/material.dart';
import 'package:saishu_kadai_1/days/fri.dart';
import 'package:saishu_kadai_1/days/mon.dart';
import 'package:saishu_kadai_1/days/sat.dart';
import 'package:saishu_kadai_1/days/sun.dart';
import 'package:saishu_kadai_1/days/thur.dart';
import 'package:saishu_kadai_1/days/tues.dart';
import 'package:saishu_kadai_1/days/wed.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(
    MaterialApp(
      title: "最終課題",
      home: MyApp(),
      theme: ThemeData.dark(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> days = const [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];
  List<String> monls = const [];
  List<String> tuels = const [];
  List<String> wedls = const [];
  List<String> thuls = const [];
  List<String> frils = const [];
  List<String> satls = const [];
  List<String> sunls = const [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _renderTask();
  }

  void _renderTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      monls = prefs.getStringList('fromMon') ?? [];
      tuels = prefs.getStringList('fromTue') ?? [];
      wedls = prefs.getStringList('fromWed') ?? [];
      thuls = prefs.getStringList('fromThu') ?? [];
      frils = prefs.getStringList('fromFri') ?? [];
      satls = prefs.getStringList('fromSat') ?? [];
      sunls = prefs.getStringList('fromSun') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "最終課題：課題整理アプリ",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue.shade800,
        actions: <Widget>[
          IconButton(onPressed: null, icon: const Icon(Icons.accessibility),)
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //月曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    monls = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Monday();
                    }));
                    print(monls);
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      monls;
                      prefs.setStringList('fromMon', monls);
                    });
                  },
                  child: Text(
                    days[0],
                    style: TextStyle(fontSize: 30,color: Colors.white,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  monls.length.toString(),
                  style: TextStyle(fontSize: 20,color: Colors.redAccent,),
                ),
              ],
            ),
            //火曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    tuels = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Tuesday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      tuels;
                      prefs.setStringList('fromTue', tuels);
                    });
                  },
                  child: Text(
                    days[1],
                    style: TextStyle(fontSize: 30,color: Colors.white,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  tuels.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
            //水曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    wedls = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Wednesday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      wedls;
                      prefs.setStringList('fromWed', wedls);
                    });
                  },
                  child: Text(
                    days[2],
                    style: TextStyle(fontSize: 30,color: Colors.white,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  wedls.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
            //木曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    thuls = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Thursday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      thuls;
                      prefs.setStringList('fromThu', thuls);
                    });
                  },
                  child: Text(
                    days[3],
                    style: TextStyle(fontSize: 30,color: Colors.white,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  thuls.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
            //金曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    frils = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Friday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      frils;
                      prefs.setStringList('fromFri', frils);
                    });
                  },
                  child: Text(
                    days[4],
                    style: TextStyle(fontSize: 30,color: Colors.white,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  frils.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
            //土曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    satls = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Saturday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      satls;
                      prefs.setStringList('fromSat', satls);
                    });
                  },
                  child: Text(
                    days[5],
                    style: TextStyle(fontSize: 30,color: Colors.blue,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  satls.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
            //日曜日
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    sunls = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Sunday();
                        }));
                    SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                    setState(() {
                      sunls;
                      prefs.setStringList('fromSun', sunls);
                    });
                  },
                  child: Text(
                    days[6],
                    style: TextStyle(fontSize: 30,color: Colors.red,),
                  ),
                ),
                Text(
                  "残りの課題",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  sunls.length.toString(),
                  style: TextStyle(fontSize: 20, color: Colors.redAccent,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
