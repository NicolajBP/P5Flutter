import 'package:flutter/material.dart';

class MyHours extends StatefulWidget {
  int hours;
  MyHours({required this.hours});

  @override
  State<MyHours> createState() => _MyHoursState();
}

class _MyHoursState extends State<MyHours> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Center(
        child: Text(
          widget.hours < 10 ? '0' + widget.hours.toString() : widget.hours.toString(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}