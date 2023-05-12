import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:quizez/appbrain.dart';
import 'package:quizez/questions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());
Appbrain copyclass = Appbrain();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: exam(),
          ),
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: Center(child: Text("quiz app")),
            backgroundColor: Colors.grey[700],
          ),
        ));
  }
}

class exam extends StatefulWidget {
  const exam({Key? key}) : super(key: key);
  _examState createState() => _examState();
}

class _examState extends State<exam> {
  List<Widget> x = [];
  int ra = 0;
  void checkanswer(bool useranswer) {
    setState(() {
      bool correctanswer = copyclass.getnextanswer();
      if (useranswer = correctanswer) {
        ra++;
        x.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ));
      } else {
        x.add(Padding(
          padding: const EdgeInsets.all(3.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ));
      }
      if (copyclass.isfinish() == true) {
        Alert(
            context: context,
            title: 'you have finished the quiz ',
            desc: 'you got $ra correct out of 7',
            buttons: [
              DialogButton(
                  width: 120,
                  child: Text(
                    'retry',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]).show();
        copyclass.reset();
        x = [];
        ra = 0;
      } else {
        copyclass.getnextpage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(children: x),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Image.asset(copyclass.y[copyclass.i].img),
              SizedBox(
                height: 20,
              ),
              Text(
                copyclass.y[copyclass.i].q,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              )
            ],
          ),
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
              child: Text(
                "true",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                checkanswer(true);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.indigo)),
        )),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: TextButton(
              child: Text(
                "false",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                checkanswer(false);
              },
              style: TextButton.styleFrom(backgroundColor: Colors.deepOrange)),
        ))
      ],
    );
  }
}
