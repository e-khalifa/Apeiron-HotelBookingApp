import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/material.dart';

class RoomViewSelection extends StatefulWidget {
  String selectedItem;
  final ValueChanged<String>
      onChanged; //needed to keep the values updated outside of the class

  RoomViewSelection(
      {super.key, required this.selectedItem, required this.onChanged});

  @override
  State<RoomViewSelection> createState() => _RoomViewSelectionState();
}

class _RoomViewSelectionState extends State<RoomViewSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'View:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.brown.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlutGroupedButtons<Map<String, dynamic>>(
          isRadio: true,
          titleCheckSpace: 10,
          activeColor: Colors.brown.shade800,
          idKey: 'id', //value
          valueKey: 'View',
          data: [
            {'id': 'city', 'View': 'City View'},
            {'id': 'sea', 'View': 'Sea View'},
            {'id': 'garden', 'View': 'Garden View'},
          ],

          //used yo update the value
          onChanged: (value) {
            setState(() {
              widget.selectedItem = value;
            });

            widget.onChanged(
                value); //the ValueChanged function, to allow other classes to handel this updated value
          },
        ),
      ],
    );
  }
}
