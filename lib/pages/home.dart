import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';

import '../widgets/check_dates.dart';
import '../widgets/extra_check_box.dart';
import '../widgets/room_view_radio_check.dart';
import '../widgets/slider.dart';
import 'rooms_available.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double adultsNumber = 0;
  double childernNumber = 0;
  String selectedView = '';

  double guests() => adultsNumber + childernNumber;

  //simple validation check (Guests, selecteView)
  void onNextButtonPressed() {
    if (guests() == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Please state the number of guests',
              textAlign: TextAlign.center,
            )),
      );
    } else if (selectedView == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Please select your preferred room view from the list "View"',
              textAlign: TextAlign.center,
            )),
      );
    } else {
      //All good? navigate to next page
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
                //because there is a card on this, "color" didn't show white, so i had to use surfacetint
                surfaceTintColor: Colors.white,
                elevation: 8,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Column(
                    children: [
                      //Calling Checkdates
                      CheckDates(label: 'Check-in Date:  '),
                      CheckDates(
                        label: 'Check-out Date:',
                      ),
                      SizedBox(height: 8),

                      //dividing line
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
                      SizedBox(height: 20),

                      //Calling Extra
                      Extra(),
                      SizedBox(height: 20),

                      //Calling View
                      RoomViewSelection(
                        selectedItem: selectedView,
                        onChanged: (newValue) {
                          setState(() {
                            selectedView = newValue;
                          });
                        },
                      ),
                      SizedBox(height: 20),

                      //Next button - right
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
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
