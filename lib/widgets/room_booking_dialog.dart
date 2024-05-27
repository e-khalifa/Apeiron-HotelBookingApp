import 'package:flutter/material.dart';

import '../models/rooms.dart';

class RoomBookingDialog extends StatelessWidget {
  final Room room;

  RoomBookingDialog({required this.room});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Room #${room.number}',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        room.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 8),
                    Divider(color: Colors.grey), // Add a horizontal divider
                    SizedBox(height: 8),
                    Text(
                      '${room.type} with ${room.view} View',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        'Occupation: Max. ${room.capacity} ${room.capacity == 1 ? 'Person' : 'People'}'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800)),
            ),
            TextButton(
              onPressed: () {
                room.isFree = false;
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '♪⁠┌⁠|⁠∵⁠|⁠┘⁠♪  Room Booked Successfully!  ♪└⁠|⁠∵⁠|⁠┐⁠♪',
                      textAlign: TextAlign.center,
                    ),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              child: Text('Confirm Booking',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.brown.shade800)),
            ),
          ],
        ),
      ],
    );
  }
}
