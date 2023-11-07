import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p5/MenuPage/time_wheel.dart';


class NotficationPage extends StatefulWidget {

  const NotficationPage({super.key});
  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
bool _notifications = false;
bool _inactivityNotificantion = false;

late int _dayTime = 0;
late int _hourTime = 0;
late int _minuteTime = 0;



  

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
          child: ListTile(                              //selve bar button
          leading: const Icon(Icons.access_time),      //Icon
          title: const Text('Current time between notification:'),    //Text  i baren
          trailing: CupertinoButton(                          //Vi laver en knap til højre side
            child: const Text("$_dayTime"),                          //Knappens tekst
            onPressed: () {
              showCupertinoModalPopup(                      //Knappen skal lave et popup ved tryk
                context: context, 
                builder: (BuildContext builder) {
                  return CupertinoPopupSurface(            //Vi returner popup
                    child: Container(
                      color: CupertinoColors.white,       //Hvid baggrund
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 400,
                      child:  Column(children: [
                        const Center(
                          child: SizedBox(                   //Timewheel indsættes henover
                            width: double.infinity,
                            height: 300,
                            child: TimeWheel(),
                          ),
                        ),
                        Center(                              //Knap som gemmer indstillet tid.
                          child: CupertinoButton(
                            child: const Text('Gem'), 
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const NotficationPage()));
                              });
                            },
                            ),
                          ),
                      ],
                    ),
                  ),
                );
                },
              );
            },
          )
          ),
        ),
      ),
          )]) else Container()

          ],
        ) else Container()                                           //Hvis ikke den er true displayer vi ikke noget
        ]
      ),  
    );  
  } 
}


