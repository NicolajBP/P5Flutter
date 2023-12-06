// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHours extends StatefulWidget {
  int hours;
  // ignore: use_key_in_widget_constructors
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