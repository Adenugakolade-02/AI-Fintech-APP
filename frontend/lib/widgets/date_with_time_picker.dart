import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

import '../utils/constant_functions.dart';

class DateWithTimePicker extends StatefulWidget {
  final Function(int) function;
  final String title;
  final String hintText;

  const DateWithTimePicker({Key? key,required this.title, required this.function,this.hintText=''}) : super(key: key);
  @override
  State<DateWithTimePicker> createState() => _DateWithTimePickerState();
}

class _DateWithTimePickerState extends State<DateWithTimePicker> {
  TextTheme textTheme = TEXT_THEME_DEFAULT;

  final dateTimeController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.year,
        builder: (context, child){
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        },
        firstDate: DateTime(2016),
        lastDate: DateTime(2023));
        if (picked != null)
          setState(() {
            selectedDate = picked;
            _selectTime(context);
          });

  }

  _selectTime(BuildContext context) async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child){
          return Theme(
            data: ThemeData.light(),
            child: child!,
          );
        },
    );
    if (timeOfDay != null) {
      setState(() {
        selectedTime = timeOfDay;
        dateTimeController.text= DateTime(selectedDate.year, selectedDate.month, selectedDate.day,selectedTime.hour, selectedTime.minute).toString();
        widget.function(selectedTime.hour);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    dateTimeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:72,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title,style: textTheme.headline3),
          addVerticalSpace(3),
          TextFormField(
            style: textTheme.headline4,
            controller: dateTimeController,
            readOnly: true,
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding: const EdgeInsets.only(left: 16),
              suffixIcon: const Icon(Icons.access_time),
            ),
            onTap: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
