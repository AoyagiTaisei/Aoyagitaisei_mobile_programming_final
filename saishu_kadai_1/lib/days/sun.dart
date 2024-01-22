import 'package:flutter/material.dart';
import 'package:saishu_kadai_1/days/nyuryoku.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sunday extends StatefulWidget {
  const Sunday({super.key});

  @override
  State<Sunday> createState() => _SundayState();
}

class _SundayState extends State<Sunday> {
  String SunTask = "";
  String Task1 = "null";
  List<String> taskList7 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _renderTask();
  }

  void _renderTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      taskList7 = prefs.getStringList('TaskList7') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sunday",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                Task1 = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                      return NewTask();
                    }));
                print(Task1);
                SharedPreferences prefs =
                await SharedPreferences.getInstance();
                setState(() {
                  taskList7.add(Task1);
                  prefs.setStringList('TaskList7', taskList7);
                });
              },
              child: Text(
                "新しい課題を入力",
                style: TextStyle(fontSize: 30, color: Colors.cyanAccent),
              ),
            ),
            SizedBox(
              //SizedBoxでかこうとListViewをColumnの中に入れられる
              height: 600,
              child: ListView.builder(
                  itemCount: taskList7.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      child: Card(
                        color: Colors.white12,
                        child: ListTile(
                          leading: Icon(
                            Icons.timelapse,
                          ),
                          title: Text(
                            taskList7[index],
                            style: TextStyle(fontSize: 30),
                          ),
                          trailing: Icon(
                            Icons.add,
                          ),
                        ),
                      ),
                      onDismissed: (direction) async {
                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        setState(() {
                          taskList7.removeAt(index);
                          prefs.setStringList('TaskList7', taskList7);
                        });
                      },
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, taskList7);
              },
              child: Text(
                "←初期画面へ",
                style: TextStyle(fontSize: 20, color: Colors.white,),
              ),
            ),
            Text(
              "*左上の戻るボタンからだと、残りの課題数が反映されないです",
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

