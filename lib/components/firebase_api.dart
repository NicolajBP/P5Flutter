
import 'package:firebase_messaging/firebase_messaging.dart';
class FirebaseApi{

//instance of firebase messaging 

final _firebaseMessaging = FirebaseMessaging.instance;


//function to initialize notifications 

Future<void> initNotifications() async {

    // Request permission from the user
    await _firebaseMessaging.requestPermission();

    // Fetch a FCM token (each device has a unique token)
    final fCMtoken = await _firebaseMessaging.getToken();


print('token: ' + fCMtoken.toString());

//function to handle recived messages

//function to initialize foreground and background settings

}
}
