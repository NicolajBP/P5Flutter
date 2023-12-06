// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SocialItem extends StatelessWidget {
  

 

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        child: InkWell(
          splashColor: Colors.green[700],
          child: const Padding(
            padding: EdgeInsets.all(
              15,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}