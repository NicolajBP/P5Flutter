import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{

//instance of firebase messaging 

final _firebaseMessaging = FirebaseMessaging.instance;


//function to initialize notifications 

Future<void> initNotifications() async {
  try {
    // Request permission from the user
    await _firebaseMessaging.requestPermission();

    // Fetch a FCM token (each device has a unique token)
    final fCMtoken = await _firebaseMessaging.getToken();

    if (fCMtoken != null) {
      // Print the token, normally it is sent to the server
      print('Token: $fCMtoken');
    } else {
      print('Failed to retrieve FCM token');
    }
  } catch (e) {
    print('Error initializing notifications: $e');
  }
}

//function to handle recived messages

//function to initialize foreground and background settings


}