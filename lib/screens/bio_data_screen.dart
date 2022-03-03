import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/bankname_dropdown_menu.dart';
import 'package:superlender/widgets/company_name_headings.dart';
import 'package:superlender/widgets/drop_downItems.dart';
import 'package:superlender/widgets/navigator_button.dart';
import 'package:superlender/widgets/profileinfo_subheading.dart';
import 'package:superlender/widgets/plain_title_with_FormField.dart';
import 'package:superlender/widgets/title_with_iconFormField.dart';
import '../utils/constant_functions.dart';
import '../widgets/progression_indicator.dart';
import 'loan_details_screen.dart';

class BioDataScreen extends StatelessWidget {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;

  // void navPage(){
  //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoanDetails()));
  // }
  @override
  
  Widget build(BuildContext context) {

    void navPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoanDetails()));
  }

    return Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
          builder: (context, constraints){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal:24),
              child: Column(children: [
                CompanyHeading(),
                
                addVerticalSpace(48),
                Center(child: HardCodeProgressionIndicator(screenOne: true,)),
                addVerticalSpace(10),

                
                Container(
                  height: constraints.maxHeight-120,
                  child: SingleChildScrollView(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      addVerticalSpace(20),
                  
                      Center(child: Text('Profile info', style: textTheme.headline1,)),
                  
                      addVerticalSpace(6),
                  
                      ProfileInfoSubHeadings(),

                      addVerticalSpace(32),

                      const Divider(color: Color(0xFFBBBFC1),),
                      addVerticalSpace(32),
                      Text('Personal Data',style: textTheme.headline2),
                      
                      addVerticalSpace(2),
                      Text('specify exactly as in your passport',style: textTheme.subtitle2),
                      
                      addVerticalSpace(32),
                      const PlainTitlewithFormField(text: 'First name'),
                      
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Second name'),
                      
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Age',number:true),
                      
                      addVerticalSpace(10),
                      const DropDownItems(items: ['Null','Savings','Current','Other'], title: 'Account Type'),
                      
                      addVerticalSpace(10),
                      const DropDownItems(items: ['Permanent','Unemployed','Self-Employed','Student','Retire','Contract'], title: 'Employment Status',),
                      
                      addVerticalSpace(10),
                      const DropDownItems(items: ['Null','Primary','Secondary','Graduate','Post Graduate'], title: 'Education'),
                      
                      addVerticalSpace(10),
                      BankNameDropDown(),
                      
                      addVerticalSpace(32),
                      Center(child: NavigatorButton(function: navPage)),
                      
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