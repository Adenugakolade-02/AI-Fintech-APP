import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

import '../utils/constant_functions.dart';

class BankNameDropDown extends StatefulWidget {
  @override
  State<BankNameDropDown> createState() => _BankNameDropDownState();
}

class _BankNameDropDownState extends State<BankNameDropDown> {
  
  Map<String,String> bankWithLogos = {
    'Diamond Bank': 'assets/images/Diamond Bank.jpg',
    'GT Bank': 'assets/images/gtbank.png',
    'EcoBank': 'assets/images/ecobank.png',
    'First Bank': 'assets/images/firstbank.png',
    'null': 'assets/images/null.png',
    'Access Bank': 'assets/images/accessbank.png',
    'UBA': 'assets/images/uba.png',
    'Union Bank': 'assets/images/unionbank.png',
    'FCMB': 'assets/images/fcmb.png',
    'Zenith Bank': 'assets/images/zenith bank.png',
    'Stanbic IBTC': 'assets/images/stanbic Ibtc.png',
    'Fidelity Bank': 'assets/images/fidelity bank.jpg',
    'Wema Bank': 'assets/images/wema bank.jpg',
    'Sterling Bank': 'assets/images/sterling bank.png',
    'Skye Bank': 'assets/images/skye.jpg',
    'Keystone Bank': 'assets/images/keystone bank.jpg',
    'Heritage Bank': 'assets/images/heritage bank.jpg',
    'Unity Bank': 'assets/images/unity bank.png',
    'Standard Chartered': 'assets/images/standard charted.png',
  };

  final TextTheme textTheme = TEXT_THEME_DEFAULT;

  dynamic dropDownValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dropDownValue = LogosWithText(bankname: bankWithLogos.entries.toList()[0].key,logo: bankWithLogos.entries.toList()[0].value);
    dropDownValue = bankWithLogos.entries.toList()[0].key;
  }

  // LogosWithText(bankname: bankWithLogos[0].key as String,logo: ,);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Bank Name', style: textTheme.headline3),
          addVerticalSpace(3),
          DropdownButtonFormField(
            value: dropDownValue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: bankWithLogos.entries.toList().map((dynamic items) {return DropdownMenuItem(value:items.key , child: LogosWithText(bankname: items.key,logo: items.value));}).toList(),
          
            onChanged: (newValue) {
              setState(() {
                dropDownValue = newValue ;
              });
            },
          
            decoration: const InputDecoration(
              contentPadding:  EdgeInsets.only(left:16)
            ),
            style: textTheme.headline4,
            ) ,
        ],
      ),
    );
  }
}

class LogosWithText extends StatelessWidget {
  final String bankname;
  final String logo;

  const LogosWithText({Key? key, required this.bankname, required this.logo}) : super(key: key);

  final TextTheme textTheme = TEXT_THEME_DEFAULT;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 40,
          width: 40,
          child: Image.asset(logo,fit: BoxFit.contain)
        ),
        addVerticalSpace(7),
        Text(bankname,style: textTheme.headline4)
      ],
    );
  }
}