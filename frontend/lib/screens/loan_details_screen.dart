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
  ExperimentingDatabase instanceOFDatabase = ExperimentingDatabase();
  TextTheme  textTheme = TEXT_THEME_DEFAULT;

  void saveLoanAmount(int value){loanAmount=value;}
  void saveTermDays(int value){termsDay=value;}
  void saveCreationDate(int value){createdDate=value;}
  void saveApprovedDate(int value){approvedDate=value;}
  void saveTotalAmount(int value){totalAmount=value;}
  void savePreviousNumberLoans(int value){numberLoans=value;}
  void saveTotalDue(int value){totalDue=value;}
  void saveCurrentNumberOfLoans(int value){numberOfCurrentLoan=value;}
  void dataSaved(){
    savedData={'loanAmount':loanAmount,
    'termsDay':termsDay,
    'createdDate':createdDate,
    'approvedDate':approvedDate,
    'totalAmount':totalAmount,
    'previousNumberLoans':numberLoans,
    'loanDues' :totalDue,
    'currentNumberloans': numberOfCurrentLoan
    };
    
  }
  void parseDataToDataBase(){
    dataSaved();
    // savedData!.forEach((key, value) {previousData!.addAll({key:value});});
    // print(savedData);
    instanceOFDatabase.storeScreenTwo(savedData!);
    }

  

  bool _isPreviousLoan = false;
  // Map<String, dynamic>? previousData;
  Map<String,dynamic>? savedData;
  int? loanAmount;
  int? termsDay;
  int? createdDate;
  int? approvedDate;
  int? totalDue;
  int? numberOfCurrentLoan;
  int totalAmount=0;
  int numberLoans =0;

  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Map<String, dynamic>previousData = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    instanceOFDatabase.storeScreenOne(previousData);
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
                      PlainTitlewithFormField(text: 'Total Due',number: true,function: (_){saveTotalDue(int.parse(_));},),

                      addVerticalSpace(10),
                      PlainTitlewithFormField(text: 'Number of Current Loan',number: true,function: (_){saveCurrentNumberOfLoans(int.parse(_));},),
                      
                      addVerticalSpace(10),
                      DateWithTimePicker(title: 'Creation Date', function: (_){saveCreationDate(_);}),
                      
                      
                      addVerticalSpace(10),
                      DateWithTimePicker(title: 'Approved Date', function: (_){saveApprovedDate(_);}),
                      
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
                      PlainTitlewithFormField(text:'Counts Of Previous Loan',number: true,function: (_){savePreviousNumberLoans(int.parse(_));}),
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