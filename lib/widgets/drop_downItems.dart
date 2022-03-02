import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class DropDownItems extends StatefulWidget {
  final List<String> items;
  final String title;

  const DropDownItems({Key? key, required this.items, required this.title}) : super(key: key);
  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  TextTheme textTheme = TEXT_THEME_DEFAULT;
  String? dropdownvalue;

  
  @override
  void initState() {
    // TODO: implement initState
    dropdownvalue = widget.items[0];
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    // String dropdownvalue = items[0];
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
