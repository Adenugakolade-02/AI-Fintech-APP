import 'package:flutter/material.dart';

class DropDownItems extends StatefulWidget {
  final List<String> items;

  const DropDownItems({Key? key,  required this.items}) : super(key: key);
  @override
  State<DropDownItems> createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  
  
  @override
  Widget build(BuildContext context) {
    // String dropdownvalue = items[0];
    String dropdownvalue = widget.items[0];
    return Flexible(
          child: DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                      items:widget.items.map((String items) {
                         return DropdownMenuItem(
                             value: items,
                             child: Text(items)
                         );
                    }
                    ).toList(),
                  onChanged: (newValue){
                    setState(() {
                      dropdownvalue = newValue as String;
                    });
                  },
                ),
    )
      
    ;
  }
}