import 'package:flutter/material.dart';
import '../models/rooms.dart';

class RoomCardBuilder extends StatelessWidget {
  final Room room;

  RoomCardBuilder({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '${room.type} With ${room.view} View',
            style: TextStyle(
              color: Colors.brown.shade800,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Occupation: Max. ${room.capacity} ${room.capacity == 1 ? 'Person' : 'People'}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              room.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
