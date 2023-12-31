// ignore_for_file: library_private_types_in_public_api, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:p5/components/firebase_api.dart';


class NotficationPage extends StatefulWidget {
  const NotficationPage({super.key});

  @override
  State<NotficationPage> createState() => _NotficationPageState();
}

class _NotficationPageState extends State<NotficationPage> {
  bool _notifications = true;
  DateTime dateTime = DateTime.now();
  Duration notificationInterval = const Duration(minutes: 30); // Default interval is 30 minutes


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
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
                    Radius.circular(20.0),
                  ),
                ),
                child: SwitchListTile(
                  title: const Text('Allow notifications'),
                  value: _notifications,
                  onChanged: (bool value) {
                    setState(() {
                      _notifications = value;
                    });
                  },
                  secondary: const Icon(Icons.notifications),
                ),
              ),
            ),
          ),
          if (_notifications)
            NotificationSettingsWidget(
              dateTime: dateTime,
              notificationInterval: notificationInterval,
              onDateTimeChanged: (DateTime newTime) {
                setState(() => dateTime = newTime);
              },
              onIntervalChanged: (Duration newInterval) {
                setState(() => notificationInterval = newInterval);
              },
              onSaveInactivityReminder: () {
                // Save as scheduled time
                NotificationService().scheduleNotification(
                  title: 'Scheduled Notification',
                  body: '$dateTime',
                  scheduledNotificationDateTime: dateTime,
                  interval: Duration.zero,
                );
              },
              onIntervalSavePressed: () {
                // Do nothing when the interval save button is pressed
              },
            ),
            
        ],
      ),
    );
  }
}

class NotificationSettingsWidget extends StatefulWidget {
  final DateTime dateTime;
  final Duration notificationInterval;
  final ValueChanged<DateTime> onDateTimeChanged;
  final ValueChanged<Duration> onIntervalChanged;
  final VoidCallback onSaveInactivityReminder;
  final VoidCallback onIntervalSavePressed;

  // ignore: use_key_in_widget_constructors
  const NotificationSettingsWidget({
    required this.dateTime,
    required this.notificationInterval,
    required this.onDateTimeChanged,
    required this.onIntervalChanged,
    required this.onSaveInactivityReminder,
    required this.onIntervalSavePressed,
  });

  @override
  _NotificationSettingsWidgetState createState() =>
      _NotificationSettingsWidgetState();
}

class _NotificationSettingsWidgetState
    extends State<NotificationSettingsWidget> {
  Duration selectedInterval = Duration.zero;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Radius.circular(20.0),
                ),
              ),
              child: ListTile(
                leading: const Icon(Icons.access_time),
                title: const Text('Time of recurring notification:'),
                trailing: CupertinoButton(
                  child: Text(
                    'Kl. ${widget.dateTime.hour}'.padLeft(2, '0') +
                        ':' +
                        '${widget.dateTime.minute}'.padLeft(2, '0'),
                  ),
                  onPressed: () {
                    showModalBottomSheet(                                       //Inactivityreminder
                      context: context,
                      builder: (BuildContext context) => SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: CupertinoDatePicker(
                          initialDateTime: widget.dateTime,
                          onDateTimeChanged: widget.onDateTimeChanged,
                          use24hFormat: true,
                          mode: CupertinoDatePickerMode.time
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: widget.onSaveInactivityReminder,
                child: const Text('Save recurring notification (Time)'),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child: const Text(
              'Or',
              style: TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold
                ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              _showIntervalPicker(context);
            },
            child: Material(
              borderRadius: BorderRadius.circular(10.0),
              elevation: 7,
              shadowColor: const Color.fromARGB(255, 209, 198, 191),
              child: Container(
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.timer),
                  title: const Text('Inactivity interval:'),
                  trailing: CupertinoButton(
                    child: Text(
                      '${widget.notificationInterval.inHours}h ${widget.notificationInterval.inMinutes.remainder(60)}min',
                    ),
                    onPressed: () {
                      _showIntervalPicker(context);
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: widget.onIntervalSavePressed,
                child: const Text('Save inactivity interval (Interval)'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showIntervalPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 250,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hm,
            minuteInterval: 5,
            initialTimerDuration: widget.notificationInterval,
            onTimerDurationChanged: (Duration duration) {
              setState(() {
                widget.onIntervalChanged(duration);
              });
            },
          ),
        );
      },
    );
  }
}
