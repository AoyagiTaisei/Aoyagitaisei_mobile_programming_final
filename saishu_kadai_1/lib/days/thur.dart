import 'package:flutter/material.dart';
import 'package:saishu_kadai_1/days/nyuryoku.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Thursday extends StatefulWidget {
  const Thursday({super.key});

  @override
  State<Thursday> createState() => _ThursdayState();
}

class _ThursdayState extends State<Thursday> {
  String ThursTask = "";
  String Task1 = "null";
  List<String> taskList4 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _renderTask();
  }

  void _renderTask() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      taskList4 = prefs.getStringList('TaskList4') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Thursday",
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white70,
        actions: <Widget>[
          IconButton(
            onPressed: ()async{
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState((){
                taskList4 = [];
                prefs.setStringList('TaskList4', taskList4);
              });
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.black,
            ),
          ),
        ],
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
                  taskList4.add(Task1);
                  prefs.setStringList('TaskList4', taskList4);
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
                  itemCount: taskList4.length,
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
                            taskList4[index],
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
                          taskList4.removeAt(index);
                          prefs.setStringList('TaskList4', taskList4);
                        });
                      },
                    );
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, taskList4);
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

