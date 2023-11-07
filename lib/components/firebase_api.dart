import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:p5/firebase_options.dart';
import 'package:p5/main.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  // Instance of Firebase messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // Function to initialize notifications
  Future<void> initNotifications() async {
    // Request permission from the user
   final messaging = FirebaseMessaging.instance;

    final settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
    );

    // Fetch a FCM token (each device has a unique token)
    String? fCMtoken = await _firebaseMessaging.getToken();
    print('token: $fCMtoken');

    //Web Token
    // TODO: replace with your own VAPID key(editing later)
 const vapidKey = "<YOUR_PUBLIC_VAPID_KEY_HERE>";

 // use the registration token to send messages to users from your trusted server environment
 String? token;

 if (DefaultFirebaseOptions.currentPlatform == DefaultFirebaseOptions.web) {
   token = await messaging.getToken(
     vapidKey: vapidKey,
   );
 } else {
   token = await messaging.getToken();
 }

 
   print('Registration Token=$token');


    

    // Set up message handlers(that is what the app does in diffrent situations)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle the message when the app is in the foreground
      print("onMessage: ${message.data}");
      // You can display a notification or perform some action here
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      // Handle the message when the user taps the notification and the app is in the background
      print("onResume: ${message.data}");
      // Navigate to the login screen
      

    });

    //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Subscribe to a topic if needed
    // await _firebaseMessaging.subscribeToTopic('your_topic_name');

    // Function to initialize foreground and background settings
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }



  // Function to handle background messages
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("onBackgroundMessage: ${message.data}");
    // Handle the message when the app is terminated, and the user taps the notification
 
    
  navigatorkey.currentState?.pushNamed('AuthPage', arguments: message,);
  }
}
//schedule notifications

  // to schedule a local notification
  // Function to schedule recurring notifications
  Future<void> scheduleRecurringNotifications() async {
    tz.initializeTimeZones();

    // Schedule notifications at a specific interval
    final timeInterval = const Duration(hours: 24); // Schedule daily notifications

    // Calculate the initial notification time (e.g., 24 hours from now)
    final initialNotificationTime = tz.TZDateTime.now(tz.local).add(timeInterval);

    // Schedule recurring notifications
    for (int i = 0; i < 5; i++) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        i,
        'Recurring Notification',
        'This is a recurring notification.',
        initialNotificationTime.add(timeInterval * i), // Adjust the time interval as needed
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel 3',
            'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exact,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'your_payload_$i',
      );
    }
  }
