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
  void _showAlert(BuildContext context,String title ,String message,bool isTrue) {
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
          onPressed: (){
              if(!isTrue){
                Navigator.pop(context);
              }
              else{
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              }

          },
          splashColor: Colors.green,
        ),
          ],

        )
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
            child: Text(widget.category.question,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: MaterialButton(
              height: 40.0,
              minWidth: 60.0,
              color: Colors.teal,
              textColor: Colors.white,
              child: Text(widget.category.correct_answer),
              onPressed: (){
                _showAlert(context,"Enhorabuena!!","Respuesta correcta!",true);
              },
              splashColor: Colors.green,
            ),

          ),
          Padding(
            padding: const EdgeInsets.only(top :150.0),
            child: Center(
              child: MaterialButton(
                height: 40.0,
                minWidth: 60.0,
                color: Colors.teal,
                textColor: Colors.white,
                child: Text(widget.category.incorrect_answers[0].toString()),
                onPressed: (){
                  _showAlert(context,"Mal!","Respuesta icorrecta!",false);

                },
                splashColor: Colors.green,
              ),

            ),
          ),
        ],
      ),
    );
  }
}
