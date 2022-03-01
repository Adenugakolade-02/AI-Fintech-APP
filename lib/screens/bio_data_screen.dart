import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/company_name_headings.dart';
import 'package:superlender/widgets/profileinfo_subheading.dart';
import 'package:superlender/widgets/plain_title_with_FormField.dart';
import 'package:superlender/widgets/title_with_iconFormField.dart';
import '../utils/constant_functions.dart';

class BioDataScreen extends StatelessWidget {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
          builder: (context, constraints){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal:24),
              child: Column(children: [
                CompanyHeading(),
                
                Container(
                  height: constraints.maxHeight*0.8,
                  child: SingleChildScrollView(
                    child : Column(
                      children: <Widget>[
                      addVerticalSpace(20),
                  
                      Center(child: Text('Profile info', style: textTheme.headline1,)),
                  
                      addVerticalSpace(6),
                  
                      ProfileInfoSubHeadings(),

                      addVerticalSpace(32),

                      const Divider(color: Color(0xFFBBBFC1),),
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text: 'First name'),
                      addVerticalSpace(10),
                      ],)
                  ),
                )

              ]),
            );
          },
      ),
        ),
    );
  }
}