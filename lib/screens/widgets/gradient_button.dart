import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{
  final double width;
  final double height;
  final VoidCallback onPressed;
  final Text text;
  final Icon icon;

  const GradientButton({Key? key, required this.width, required this.height, required this.onPressed, required this.text, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xffffae88), Color(0xff8f98ea)]
          )
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: this.onPressed,
        child: Row(
          children: <Widget>[
            text,
            icon
          ],
        ),
      ),
    );
  }
}