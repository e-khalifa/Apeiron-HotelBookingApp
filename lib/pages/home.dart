import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_app/pages/rooms-available.dart';
import 'package:hotel_booking_app/widgets/check_dates.dart';
import 'package:hotel_booking_app/widgets/slider.dart';
import 'package:route_transitions/route_transitions.dart';

import '../widgets/extra_check_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  double adultsNumber = 0;
  double childernNumber = 0;
  String selectedView = '';

  //Created for page: rooms-availabe to access
  String selectedRoomView() => selectedView;
  double guests() => adultsNumber + childernNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apeiron Hotel',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Sevillana',
              fontSize: 25,
              color: Colors.brown.shade800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, //backarrow off
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            color: Colors.brown.shade800,
            child: Image.asset(
              'assets/images/hotel.jpg',
              fit: BoxFit.fitWidth,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CheckDates(
              label: 'Check-in Date:   ',
            ),
          ),
          CheckDates(
            label: 'Check-out Date: ',
          ),
          SizedBox(height: 8),
          Divider(color: Colors.brown.shade800),
          SizedBox(height: 8),
          SlideBar(
            value: adultsNumber,
            guestLabel: 'Adults',
            onChanged: (newValue) {
              setState(() {
                adultsNumber = newValue;
              });
            },
          ),
          SlideBar(
            value: childernNumber,
            guestLabel: 'Children',
            onChanged: (newValue) {
              setState(() {
                childernNumber = newValue;
              });
            },
          ),
          SizedBox(height: 8),
          Divider(color: Colors.brown.shade800),
          SizedBox(height: 8),
          Text(
            'Extras:',
            style: TextStyle(
              fontSize: 18,
              color: Colors.brown.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          Extra(),
          SizedBox(height: 8),
          Divider(color: Colors.brown.shade800),
          SizedBox(height: 8),
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
            idKey: 'id',
            valueKey: 'View',
            data: [
              {'id': 'city', 'View': 'City View'},
              {'id': 'sea', 'View': 'Sea View'},
              {'id': 'garden', 'View': 'Garden View'},
            ],
            onChanged: (value) {
              setState(() {
                selectedView = value;
              });
              print(value);
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: TextButton(
                onPressed: () {
                  slideRightWidget(
                      newPage: RoomsAvailable(
                          guests: guests, selectedRoomView: selectedRoomView),
                      context: context);
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.brown.shade800),
                child: Text('Next', style: TextStyle(fontSize: 16))),
          ),
        ],
      ),
    );
  }
}
