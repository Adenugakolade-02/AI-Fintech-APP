import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final Color color;
  final TextStyle style;

  const HomeButton({Key? key, required this.text, required this.color,required this.style}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    
    return ElevatedButton(
      onPressed: (){},
      child: Text(text,style: style),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        fixedSize: Size(width,64)
      )
    );
  }
}