import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';

import '../widgets/check_dates.dart';
import '../widgets/extra_check_box.dart';
import '../widgets/room_view_radio_check.dart';
import '../widgets/slider.dart';
import 'rooms_available.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  double adultsNumber = 0;
  double childernNumber = 0;
  String selectedView = '';

  double guests() => adultsNumber + childernNumber;

  //simple validation check (Guests, selectedRoomView)
  void onNextButtonPressed() {
    if (guests() == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please State the Guests Number')),
      );
    } else if (selectedView == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Please Choose Your Preferred Room-View from the List "View"')),
      );
    } else {
      slideRightWidget(
        newPage: RoomsAvailable(
          guests: guests,
          selectedRoomView: selectedView,
        ),
        context: context,
      );
    }
  }

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
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Card(
                elevation: 8,
                color: Colors.brown.shade800,
                child: Container(
                  height: 240,
                  child: Image.asset(
                    'assets/images/hotel.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                surfaceTintColor: Colors.white,
                elevation: 8,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      CheckDates(label: 'Check-in Date:  '),
                      CheckDates(
                        label: 'Check-out Date:',
                      ),

                      SizedBox(height: 8),
                      Divider(color: Colors.brown.shade800),
                      SizedBox(height: 8),

                      //calling slidebar
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

                      //calling extra
                      SizedBox(height: 20),

                      Extra(),
                      SizedBox(height: 20),
                      RoomViewSelection(
                        selectedItem: selectedView,
                        onChanged: (newValue) {
                          setState(() {
                            selectedView = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            onNextButtonPressed();
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: Colors.brown.shade800,
                          ),
                          child: Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
