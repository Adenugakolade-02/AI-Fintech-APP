import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/widgets/bankname_dropdown_menu.dart';
import 'package:superlender/widgets/company_name_headings.dart';
import 'package:superlender/widgets/date_with_time_picker.dart';
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

  static const routeName = 'loan_screen';
}

class _LoanDetailsState extends State<LoanDetails> {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;

  void saveLoanAmount(int value){loanAmount=value;}
  void saveTermDays(int value){termsDay=value;}
  void saveCreationDate(String value){createdDate=value;}
  void saveApprovedDate(String value){approvedDate=value;}
  void saveTotalAmount(int value){totalAmount=value;}
  void saveNumberLoans(int value){numberLoans=value;}
  
  void dataSaved(){
    savedData={'loanAmount':loanAmount,
    'termsDay':termsDay,
    'createdDate':createdDate,
    'approvedDate':approvedDate,
    'totalAmount':totalAmount,
    'numberLoans':numberLoans};
    
  }
  void parseDataToDataBase(){
    dataSaved();
    savedData!.forEach((key, value) {previousData!.addAll({key:value});});
    }

  bool _isPreviousLoan = false;
  Map<String, dynamic>? previousData;
  Map<String,dynamic>? savedData;
  int? loanAmount;
  int? termsDay;
  String? createdDate;
  String? approvedDate;
  int totalAmount=0;
  int numberLoans =0;

  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    previousData = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
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
                      PlainTitlewithFormField(text: 'Loan Amount',number: true,function: (_){saveLoanAmount(int.parse(_));},),
                      
                      addVerticalSpace(10),
                      PlainTitlewithFormField(text:'Term Days',number: true,function: (_){saveTermDays(int.parse(_));}),
                      
                      addVerticalSpace(10),
                      DateWithTimePicker(title: 'Creation Date', function: (_){saveCreationDate(_);}),
                      // PlainTitlewithFormField(text:'Creation Date',number:true,function: (_){saveCreationDate(int.parse(_));}),
                      
                      addVerticalSpace(10),
                      DateWithTimePicker(title: 'Approved Date', function: (_){saveApprovedDate(_);}),
                      // PlainTitlewithFormField(text:'Approved Date',number:true,function: (_){saveApprovedDate(int.parse(_));}),
                      
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
                      PlainTitlewithFormField(text: 'Total Amount',number: true,function: (_){saveTotalAmount(int.parse(_));}),
                      addVerticalSpace(10),
                      PlainTitlewithFormField(text:'Number Of Loans',number: true,function: (_){saveNumberLoans(int.parse(_));}),
                      addVerticalSpace(10),
                      ] else...[
                        Container()
                      ],
                      
                      Center(child: SaveButton(function: parseDataToDataBase,)),
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