import 'package:flutter/material.dart';
import 'package:p5/MenuPage/TimeWheel.dart';


class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
bool _notifications = false;
bool _inactivityNotificantion = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(                                           //appbar
        title: const Text("Notifications"),
      ),
      body: Column(
        children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(                                        //notification on/off button
             borderRadius: BorderRadius.circular(10.0),
             elevation: 7,
             shadowColor: const Color.fromARGB(255, 209, 198, 191),
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(       
            borderRadius: BorderRadius.all(
            Radius.circular(20.0),),
          ),
          child: SwitchListTile(                                  //selve on/of button
                title: const Text('Allow notifications'),
                value: _notifications,
                onChanged: (bool value) {
                    setState(() {
                      _notifications = value;  }); },             //hvis _notifications = true så er de slået til
      secondary: const Icon(Icons.notifications),)
          ),
        ),
      ),

      _notifications == true ?                                  //Når de er true displayer vi resten
        Column(
          children: [
                  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(                                        //notification on/off button
             borderRadius: BorderRadius.circular(10.0),
             elevation: 7,
             shadowColor: const Color.fromARGB(255, 209, 198, 191),
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(       
            borderRadius: BorderRadius.all(
            Radius.circular(20.0),),
          ),
          child: SwitchListTile(                                  //selve on/of button
                title: const Text('Allow inactivity notifications'),
                value: _inactivityNotificantion,
                onChanged: (bool value) {
                    setState(() {
                      _inactivityNotificantion = value;  }); },             //hvis _notifications = true så er de slået til
      secondary: const Icon(Icons.notifications),)
          ),
        ),
      ),

      _inactivityNotificantion == true ?
        const Column(children: [
          TimeWheel()
        ],)                                             //INPUT tidswheel her

        : Container()

          ],
        )
        : Container()                                           //Hvis ikke den er true displayer vi ikke noget
        ]
      ),  
    );  
  } 
}

