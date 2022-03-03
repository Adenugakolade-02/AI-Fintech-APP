import 'package:flutter/material.dart';
import 'package:superlender/screens/bio_data_screen.dart';
import 'package:superlender/widgets/company_name_with_logo.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void loanPage(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BioDataScreen()));
    }

    return Scaffold(
      backgroundColor: COLOR_BLUE,
      body: LayoutBuilder(builder: (context,constraints){
        return Container(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: constraints.maxWidth * 0.3,),
              
              Center(
                child: Container(
                  height: constraints.maxWidth*(2/3),
                  width: constraints.maxWidth*(2/3),
                  child: Image.asset('assets/images/superlender2 1.png',fit: BoxFit.contain,),
                ),
              ),
              SizedBox(height:constraints.maxWidth * 0.08,),
              
              Center(child: ComapanyNameWithLogo(height: constraints.maxWidth,width:constraints.maxWidth)),
              
              SizedBox(height:constraints.maxWidth * 0.08,),
              
              HomeButton(text: 'Get Started', color: Colors.black87, style: TEXT_THEME_DEFAULT.bodyText2!, function: loanPage,),
              
              SizedBox(height:constraints.maxWidth * 0.08,),
              
              HomeButton(text: 'About Us', color: COLOR_WHITE, style: TEXT_THEME_DEFAULT.bodyText1!,function: (){},)
            ]),
        );
      }
      ),
    );
  }
}