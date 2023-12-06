// ignore_for_file: prefer_interpolation_to_compose_strings, use_key_in_widget_constructors

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyMinutes extends StatefulWidget {
  int mins;
  MyMinutes({required this.mins});

  @override
  State<MyMinutes> createState() => _MyMinutesState();
}

class _MyMinutesState extends State<MyMinutes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Center(
        child: Text(
          widget.mins < 10 ? '0' + widget.mins.toString() : widget.mins.toString(),
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}