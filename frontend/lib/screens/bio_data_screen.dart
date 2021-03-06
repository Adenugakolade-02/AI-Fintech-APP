import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:superlender/model/database.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/bankname_dropdown_menu.dart';
import 'package:superlender/widgets/company_name_headings.dart';
import 'package:superlender/widgets/date_with_time_picker.dart';
import 'package:superlender/widgets/drop_downItems.dart';
import 'package:superlender/widgets/navigator_button.dart';
import 'package:superlender/widgets/profileinfo_subheading.dart';
import 'package:superlender/widgets/plain_title_with_FormField.dart';
import 'package:superlender/widgets/title_with_iconFormField.dart';
import '../utils/constant_functions.dart';
import '../widgets/progression_indicator.dart';
import 'loan_details_screen.dart';

class BioDataScreen extends StatefulWidget {
  


  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;

 void saveEmploymentStatus(List<int> status){
   employmentStatus = status;
 }

 void saveAccountType(List<int> status){
   accountType = status;
 }

void saveEduction(List<int> status){
   education = status;
 }

 void saveBankName(int status){
   bankName = status;
 }

 void saveAge(int status){
   age =status;
   
 }

 final _formKey = GlobalKey<FormState>();

 List<int> employmentStatus =[];

 List<int> accountType =[];

 List<int> education=[];

 int? bankName;

 int age =0;

 Map<String,dynamic>? savedData;

 void dataSaved(){
   savedData ={'employment_status':employmentStatus,
                'accountType': accountType,
                'education': education,
                'bankName':bankName,
                'age':age};
 }

 dynamic textValidator(String value){
   if(value.isEmpty||value == null){
     return "Enter some text";
   }
   return null;
 }

 dynamic numbersValidator(String value){
   if(value.isEmpty||value == null){
     return "Please Enter some number";
   }
   else if(num.tryParse(value)==null){
     return "Please enter a valid number";
   }
   else if(num.tryParse(value)!.isNegative){
     return "Please enter a positive number";
   }
   return null;
 }

 void navPage(BuildContext context){
    dataSaved();
    Navigator.pushReplacementNamed(context, LoanDetails.routeName,arguments: savedData);}

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
                
                addVerticalSpace(48),
                Center(child: HardCodeProgressionIndicator(screenOne: true,)),
                addVerticalSpace(10),

                
                Container(
                  height: constraints.maxHeight-120,
                  child: SingleChildScrollView(
                      child: Column(
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
                      PlainTitlewithFormField(text: 'First name',hintText: 'Enter your first name',validateForm: (_)=>textValidator(_),),
                      
                      addVerticalSpace(34),
                      PlainTitlewithFormField(text:'Second name',hintText: 'Enter second name',validateForm: (_)=>textValidator(_)),
                      
                      addVerticalSpace(10),
                      PlainTitlewithFormField(text:'Age',number:true,hintText:'Enter your age',function: (_){saveAge(int.parse(_));},validateForm: (_)=>numbersValidator(_),),
                      
                      addVerticalSpace(10),
                      DropDownItems(items: const ['Other', 'Savings', 'null', 'Current'], title: 'Account Type',function: (_){saveAccountType(_);},),
                      
                      addVerticalSpace(10),
                      DropDownItems(items: const ['Permanent', 'null', 'Unemployed', 'Self-Employed', 'Student','Retired', 'Contract'], title: 'Employment Status',function: (_){saveEmploymentStatus(_);},),
                      
                      addVerticalSpace(10),
                      DropDownItems(items: const ['Post-Graduate', 'Graduate', 'null', 'Primary', 'Secondary'], title: 'Education',function: (_){saveEduction(_);},),
                      
                      addVerticalSpace(10),
                      BankNameDropDown(function: (_){saveBankName(_);},),
                      
                      addVerticalSpace(32),
                      Center(child: NavigatorButton(function:()=>navPage(context))),
                      
                      addVerticalSpace(10),
                    
                      ],),
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