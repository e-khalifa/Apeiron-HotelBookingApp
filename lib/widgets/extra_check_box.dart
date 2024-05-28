import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/material.dart';

class Extra extends StatelessWidget {
  const Extra({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Extras:',
          style: TextStyle(
            fontSize: 18,
            color: Colors.brown.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        FlutGroupedButtons<Map<String, dynamic>>(
          titleCheckSpace: 10,
          activeColor: Colors.brown.shade800,
          idKey: 'id',
          valueKey: 'Extra',
          data: [
            {'id': 1, 'Extra': 'Breakfast (10 USD/Day)'},
            {'id': 2, 'Extra': 'WiFi (5 USD/Day)'},
            {'id': 3, 'Extra': 'Parking (5 USD/Day)'},
            {'id': 4, 'Extra': 'Swimming Pool (10 USD/Day)'},
          ],
          onChanged: (value) {
            print(value);
          },
        ),
      ],
    );
  }
}
