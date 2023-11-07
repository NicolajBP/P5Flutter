import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p5/MenuPage/TimeWheel.dart';


class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
bool _notifications = true;
bool _inactivityNotificantion = true;
int _selectedValue = 0;

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
                      _inactivityNotificantion = value;  }
                      ); 
                      },                  //hvis _notifications = true så er de slået til
                  secondary: const Icon(Icons.notifications),)
                ),
              ),
            ),

            _inactivityNotificantion == true ?
            Scaffold(
              body: SafeArea(
              child: Center(
                child: CupertinoButton.filled(
                  child: Text('Value = $_selectedValue'), 
                  onPressed: () => showCupertinoModalPopup(
                    context: context, 
                    builder: (_) => SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(
                          initialItem: 1,
                        ),
                        children: const [
                          Text('0'),
                          Text('1'),
                          Text('123'),
                        ],
                        onSelectedItemChanged: (int value) {
                          _selectedValue = value;
                        }
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ):
          ]  
        )
        
          ],
        )
    );                                   //Hvis ikke den er true displayer vi ikke noget
        
     
      
  } 
}

