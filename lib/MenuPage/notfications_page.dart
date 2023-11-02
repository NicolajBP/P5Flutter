import 'package:flutter/material.dart';


class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
bool _notifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Notifications"),
        automaticallyImplyLeading: true, //tilbageknap i appbar
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
        child: Material(
             borderRadius: BorderRadius.circular(10.0),
             elevation: 7,
             shadowColor: const Color.fromARGB(255, 209, 198, 191),
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(       
            borderRadius: BorderRadius.all(
            Radius.circular(20.0),),
          ),
          child: SwitchListTile(
                title: const Text('Allow notifications'),
                value: _notifications,
                onChanged: (bool value) {
                    setState(() {
                      _notifications = value;  });
      },
      secondary: const Icon(Icons.notifications),)
          ),
        ),
      ),

      _notifications == true ?
        Column(
          children: [
            Text('hello')
          ],
        )
        : Container()
        ]
      ),  
    );  
  } 
}

