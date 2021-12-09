import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({Key? key, required this.name, required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          onPressed();
        },
        child: Text("Login", style: TextStyle(
          fontSize: 18
        ),),
      ),
    );
  }
}
