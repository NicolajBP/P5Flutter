// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, use_key_in_widget_constructors, library_private_types_in_public_api, unused_element

import 'package:flutter/material.dart';

class DurationPicker extends StatefulWidget {
  final void Function(Duration) onDurationChanged;

  const DurationPicker({required this.onDurationChanged});

  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  int hours = 0;
  int minutes = 0;




  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (hours > 0) {
                    hours--;
                  }
                });
                widget.onDurationChanged(Duration(hours: hours, minutes: minutes));
              },
              icon: const Icon(Icons.remove),
            ),
            Text('$hours Hours'),
            IconButton(
              onPressed: () {
                setState(() {
                  hours++;
                });
                widget.onDurationChanged(Duration(hours: hours, minutes: minutes));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  if (minutes > 0) {
                    minutes--; 
                  }
                });
                widget.onDurationChanged(Duration(hours: hours, minutes: minutes));
              },
              icon: const Icon(Icons.remove),
            ),
            Text('$minutes Minutes'),
            IconButton(
              onPressed: () {
                setState(() {
                  minutes++;
                });
                widget.onDurationChanged(Duration(hours: hours, minutes: minutes));
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}
