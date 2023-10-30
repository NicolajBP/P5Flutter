import 'package:flutter/material.dart';


class CalenderBar extends StatefulWidget {
  const CalenderBar({super.key});

  @override
  State<CalenderBar> createState() => _Calenderbar();
}

class _Calenderbar extends State<CalenderBar> {


@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {

                    }, 
                    icon: const Icon(Icons.arrow_back),
                    ),



  const SizedBox(width: 10),

              const Text('25.10.23'),


   const SizedBox(width: 10),

              IconButton(onPressed: (){

              }, 
              icon: const Icon(Icons.arrow_forward)),
              ]), 
              )
          )
    );
    
  }
}

