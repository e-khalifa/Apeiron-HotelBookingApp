import 'package:flutter/material.dart';
import 'package:hotel_booking_app/widgets/room_card.dart';

import '../models/rooms.dart';
import '../widgets/room_booking_dialog.dart';

class RoomsAvailable extends StatelessWidget {
  //to access radio buttons selected value & slidebarvalues
  final double Function() guests;
  final String selectedRoomView;

  RoomsAvailable(
      {super.key, required this.guests, required this.selectedRoomView}) {
    print('Guests: ${guests()}');
    print('Selected Room View: $selectedRoomView');
  }

//Rooms data
  List<Room> rooms = [
    Room(
        isFree: true,
        number: 20,
        capacity: 2,
        view: 'Sea',
        type: 'Couples Deluxe Room',
        imagePath: 'assets/images/kingBed.jpg'),
    Room(
        isFree: true,
        number: 98,
        capacity: 12,
        view: 'Sea',
        type: 'Family Suite -Kid Friendly-',
        imagePath: 'assets/images/familyBeach.jpg'),
    Room(
        isFree: true,
        number: 109,
        capacity: 1,
        view: 'Sea',
        type: 'Single Room',
        imagePath: 'assets/images/single.jpg'),
    Room(
        isFree: true,
        number: 112,
        capacity: 6,
        view: 'City',
        type: 'Family of 6 Suite',
        imagePath: 'assets/images/family.jpg'),
    Room(
        isFree: false,
        number: 218,
        capacity: 5,
        view: 'City',
        type: 'Family of 5 Suite',
        imagePath: 'assets/images/family.jpg'),
    Room(
        isFree: true,
        number: 275,
        capacity: 8,
        view: 'City',
        type: 'Family Suite -Kid Friendly-',
        imagePath: 'assets/images/family.jpg'),
    Room(
        isFree: true,
        number: 310,
        capacity: 2,
        view: 'Garden',
        type: 'Classic Double Room',
        imagePath: 'assets/images/double.jpg'),
    Room(
        isFree: true,
        number: 406,
        capacity: 1,
        view: 'Garden',
        type: 'Standard',
        imagePath: 'assets/images/single.jpg'),
    Room(
        isFree: true,
        number: 415,
        capacity: 4,
        view: 'Garden',
        type: 'Superior Room',
        imagePath: 'assets/images/family.jpg'),
  ];

  //flitering the rooms list by user choices (view,slidebar)
  List<Room> filterRooms() {
    List<Room> filteredRooms = [];

    for (var Room in rooms) {
      if (Room.isFree &&
          guests() <= Room.capacity &&
          /*Identical doesn't compare the contents of objects or the encoding,
           but their memory location, 
           that's why it didn't triger the unrelated type equality checks like == */
          identical(Room.view.toLowerCase(), selectedRoomView.toLowerCase())) {
        filteredRooms.add(Room);
      }
    }
    print('Filtered Rooms Count: ${filteredRooms.length}');
    return filteredRooms;
  }

  @override
  Widget build(BuildContext context) {
    final filteredRooms = filterRooms();

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
      ),

      //If the filtered list is empty, return friendly msg, if not? build your cards
      body: filteredRooms.length == 0
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'SORRY! (⁠╥⁠﹏⁠╥⁠)',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'There are currently no available rooms with $selectedRoomView view for your specified number of guests',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )

          //Calling the builder widget
          : ListView.builder(
              itemCount: filteredRooms.length,
              itemBuilder: (context, index) {
                final Room = filteredRooms[index];

                //Handling tap
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return RoomBookingDialog(
                            room: Room); //Calling alert dialog
                      },
                    );
                  },
                  child: RoomCardBuilder(room: Room),
                );
              },
            ),
    );
  }
}
