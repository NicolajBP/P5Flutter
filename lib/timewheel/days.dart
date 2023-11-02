import 'package:flutter/material.dart';

class MyDays extends StatefulWidget {
  int days;
  MyDays({required this.days});

  @override
  State<MyDays> createState() => _MyDaysState();
}

class _MyDaysState extends State<MyDays> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Center(
        child: Text(
          widget.days < 10 ? '0' + widget.days.toString() : widget.days.toString(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}