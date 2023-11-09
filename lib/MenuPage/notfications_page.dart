import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p5/MenuPage/timewheel.dart';


class NotficationPage extends StatefulWidget {

  const NotficationPage({super.key});
  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
bool _notifications = false;
bool _inactivityNotificantion = false;

DateTime dateTime = DateTime(3000, 2, 1, 10, 20);
// late int _dayTime = 0;
// late int _hourTime = 0;
// late int _minuteTime = 0;



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(                                           //appbar
        title: const Text("Notifications"),
        automaticallyImplyLeading: true,                          //tilbageknap i appbar
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
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




      if (_notifications == true) Column(
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




      if (_inactivityNotificantion == true) 
       Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 7,
              shadowColor: const Color.fromARGB(255, 209, 198, 191),
              child: Container(
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0),),
                ),
                child: ListTile(                                                                    //Vi laver widget med ListTile som ligner de andre
                  leading: const Icon(Icons.access_time),                                           //Icon
                  title: const Text('Current time between notification:'),                          //Tekst
                  trailing: CupertinoButton(                                                        //Knap
                    child: Text('Kl.'+' ${dateTime.hour}'.padLeft(2,'0') +':'+'${dateTime.minute}'.padLeft(2,'0')),    //Tid der står
                    onPressed: () {
                      showCupertinoModalPopup(            //POPup med widget indeni
                        context: context, 
                        builder: (BuildContext context) => SizedBox(
                          height: 250,
                          width: double.infinity,
                          child: CupertinoDatePicker(           //Vi vælger widget
                            backgroundColor: Colors.white,      //Hvid baggrund
                            initialDateTime: dateTime,            //Den vælger nuværende date og tid
                            onDateTimeChanged: (DateTime newTime) {     //Når man ændrer på tid/dato skifter den NewTime variable
                              setState(() => dateTime = newTime);
                            },
                            use24hFormat: true,                   //24 timers format
                            mode: CupertinoDatePickerMode.time,  //Her vælger man mode :)
                            ),
                          ),
                          );
                    },

                    ),
                ),
              ),
            ),
            )
        ],
       )
       else Container()

          ],
        ) else Container()                                           //Hvis ikke den er true displayer vi ikke noget
        ]
      ),  
    );  
  } 
}


