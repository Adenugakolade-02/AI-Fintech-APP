import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class DropDownItems extends StatefulWidget {
  final List<String> items;
  final String title;
  final Function(List<int>) function;

  const DropDownItems({Key? key, required this.items, required this.title,required this.function}) : super(key: key);
  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  TextTheme textTheme = TEXT_THEME_DEFAULT;
  String? dropdownvalue;

  List<int>? encodedValues;
  
  @override
  void initState() {
    // TODO: implement initState
    dropdownvalue = widget.items[0];
    // widget.items.forEach((element) {encodedValues!.add(0);});
    // encodedValues![widget.items.indexOf(dropdownvalue!)] = 1;
    // widget.function(encodedValues!);
    super.initState();
  }


  
  
  @override
  Widget build(BuildContext context) {
    encodedValues = [];
    widget.items.forEach((element) {encodedValues!.add(0);});
    encodedValues![widget.items.indexOf(dropdownvalue!)] = 1;
    widget.function(encodedValues!);
    return Container(
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: textTheme.headline3),
          addVerticalSpace(3),
          DropdownButtonFormField(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.items.map((String items) {return DropdownMenuItem(value: items, child: Text(items));}).toList(),
          
            onChanged: (newValue) {
              setState(() {
                dropdownvalue = newValue as String;
                
                widget.items.forEach((element) {encodedValues!.add(0);});
                encodedValues![widget.items.indexOf(dropdownvalue!)] = 1;
                widget.function(encodedValues!);
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
