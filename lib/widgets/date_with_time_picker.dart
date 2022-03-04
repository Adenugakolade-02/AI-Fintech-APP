import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

import '../utils/constant_functions.dart';

class DateWithTimePicker extends StatefulWidget {
  final Function(String) function;
  final String title;

  const DateWithTimePicker({Key? key,required this.title, required this.function}) : super(key: key);
  @override
  State<DateWithTimePicker> createState() => _DateWithTimePickerState();
}

class _DateWithTimePickerState extends State<DateWithTimePicker> {
  TextTheme textTheme = TEXT_THEME_DEFAULT;

  final dateTimeController = TextEditingController();

  DateTime? utc;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
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
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        utc = DateTime(selectedDate.year, selectedDate.month, selectedDate.day,
            selectedTime.hour, selectedDate.minute);
        dateTimeController.text = utc.toString();
        widget.function(dateTimeController.text);
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
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 16),
              suffixIcon: Icon(Icons.access_time),
            ),
            onTap: () => _selectDate(context),
          ),
        ],
      ),
    );
  }
}
