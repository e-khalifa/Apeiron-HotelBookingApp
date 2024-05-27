import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CheckDates extends StatefulWidget {
  final String label;
  const CheckDates({Key? key, required this.label}) : super(key: key);

  @override
  State<CheckDates> createState() => _CheckDatesState();
}

class _CheckDatesState extends State<CheckDates> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${widget.label}',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown.shade800),
        ),
        SizedBox(width: 200),
        Text(
          '${DateFormat('MMM d, yyyy').format(selectedDate)}',
          style: TextStyle(fontSize: 13.5),
        ),
        IconButton(
          onPressed: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime(2024),
              lastDate: DateTime(2027),
            );
            if (picked != null && picked != selectedDate) {
              setState(() {
                selectedDate = picked;
              });
            }
          },
          icon: Icon(FontAwesomeIcons.calendarCheck),
          color: Colors.brown.shade800,
        ),
      ],
    );
  }
}
