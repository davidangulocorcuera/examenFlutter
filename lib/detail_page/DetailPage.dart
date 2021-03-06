import 'package:examen_flutter/model/Category.dart';
import 'package:examen_flutter/my_home_page/MyHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Category category;

  DetailPage(this.category);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _showAlert(
      BuildContext context, String title, String message, bool isTrue) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(title),
              content: Text(message),
              actions: <Widget>[
                MaterialButton(
                  height: 40.0,
                  minWidth: 60.0,
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text("X"),
                  onPressed: () {
                    if (!isTrue) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    }
                  },
                  splashColor: Colors.green,
                ),
              ],
            ));
  }

  Widget getButtons(List<dynamic> answers) {
    double padding = 50.0;
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < answers.length; i++) {
      padding = padding + 50.0;
      list.add(
        Center(
          child: Padding(
            padding:  EdgeInsets.only(top: padding),
            child: MaterialButton(
              height: 40.0,
              minWidth: 60.0,
              color: Colors.teal,
              textColor: Colors.white,
              child: Text(answers[i].toString()),
              onPressed: () {
                _showAlert(context, "Mal!", "Respuesta incorrecta!", false);
              },
              splashColor: Colors.green,
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SingleChildScrollView(child: Center(child: new Stack(children: list))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question"),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              widget.category.question,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child:  getButtons(widget.category.incorrect_answers),
            ),
          ),
          Center(
            child: MaterialButton(
              height: 40.0,
              minWidth: 60.0,
              color: Colors.teal,
              textColor: Colors.white,
              child: Text(widget.category.correct_answer),
              onPressed: () {
                _showAlert(
                    context, "Enhorabuena!!", "Respuesta correcta!", true);
              },
              splashColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
