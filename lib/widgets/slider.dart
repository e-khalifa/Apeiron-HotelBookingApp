import 'package:flutter/material.dart';

class SlideBar extends StatefulWidget {
  final String guestLabel;
  double value = 0;
  final ValueChanged<double> onChanged;

  SlideBar(
      {Key? key,
      required this.value,
      required this.guestLabel,
      required this.onChanged})
      : super(key: key);

  @override
  State<SlideBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SlideBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${widget.guestLabel}: ${widget.value.toInt()}',
          style: TextStyle(
            fontSize: 18,
            color: Colors.brown.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        Slider(
          value: widget.value,
          onChanged: (number) {
            setState(() {
              widget.value = number;
            });
            widget.onChanged(number); // Update guests' numbers here

            print(' value is${widget.value}');
            print(' number is$number');
          },
          min: 0,
          max: 6,
          divisions: 6,
          activeColor: Colors.brown.shade800,
        ),
      ],
    );
  }
}
