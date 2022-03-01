import 'package:flutter/material.dart';
import 'package:superlender/utils/company_name_with_logo.dart';
import 'package:superlender/utils/constansts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: LayoutBuilder(builder: (context,constraints){
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 120,),
              
              Center(
                child: Container(
                  height: constraints.maxWidth*(2/3),
                  width: constraints.maxWidth*(2/3),
                  child: Image.asset('assets/images/superlender2 1.png',fit: BoxFit.contain,),
                ),
              ),
              Container(height:20,),
              Center(child: ComapanyNameWithLogo(height: constraints.maxWidth,width:constraints.maxWidth))
            ]),
        );
      }
      ),
    );
  }
}