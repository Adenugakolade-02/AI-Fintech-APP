import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/bankname_dropdown_menu.dart';
import 'package:superlender/widgets/company_name_headings.dart';
import 'package:superlender/widgets/drop_downItems.dart';
import 'package:superlender/widgets/navigator_button.dart';
import 'package:superlender/widgets/profileinfo_subheading.dart';
import 'package:superlender/widgets/plain_title_with_FormField.dart';
import 'package:superlender/widgets/save_button.dart';
import 'package:superlender/widgets/title_with_iconFormField.dart';
import '../utils/constant_functions.dart';
import '../widgets/progression_indicator.dart';



class LoanDetails extends StatefulWidget {
  @override
  State<LoanDetails> createState() => _LoanDetailsState();
}

class _LoanDetailsState extends State<LoanDetails> {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;

  bool _isPreviousLoan = false;

  void navPage(){
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  LoanDetails()));
  }

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
                Center(child: HardCodeProgressionIndicator(screenOne:true,screenTwo: true,)),
                addVerticalSpace(10),
                
                Container(
                  height: constraints.maxHeight-120,
                  child: SingleChildScrollView(
                    child : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      addVerticalSpace(20),
                  
                      Center(child: Text('Loan Application', style: textTheme.headline1,)),
                  
                      addVerticalSpace(6),
                  
                      ProfileInfoSubHeadings(),

                      addVerticalSpace(32),

                      const Divider(color: Color(0xFFBBBFC1),),
                      addVerticalSpace(32),
                      Text('Loan Info',style: textTheme.headline2),
                      addVerticalSpace(2),
                      Text('enter loan details correctly',style: textTheme.subtitle2),
                      addVerticalSpace(32),
                      const PlainTitlewithFormField(text: 'Loan Amount',number: true,),
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Term Days',number: true,),
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Creation Date',number:true),
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Approved Date',number:true),
                      addVerticalSpace(10),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Obtained a Previous Loan?',style: textTheme.headline3,),
                          Checkbox(
                            value: _isPreviousLoan, onChanged: (newValue){
                              setState(() {
                                _isPreviousLoan = newValue!;
                              });
                            }),
                        ],
                      ),
                      
                      if (_isPreviousLoan) ...[
                      const PlainTitlewithFormField(text: 'Total Amount',number: true,),
                      addVerticalSpace(10),
                      const PlainTitlewithFormField(text:'Number Of Loans',number: true,),
                      addVerticalSpace(10),
                      ] else...[
                        Container()
                      ],
                      
                      Center(child: SaveButton()),
                      addVerticalSpace(10)
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