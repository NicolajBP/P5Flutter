import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;



class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
 // Initialiserer tjenesten og konfigurerer notoficationsindstillinger

  Future<void> initNotification() async {
   // Android indstillinger
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');
// iOS indstillinger
    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});


// Samlet initialiseringsindstillinger for begge platforme (Android og iOS)
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    
    // Initialiserer meddelelsesplugin med indstillinger

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
            (NotificationResponse notificationResponse) async {});
  }
// Returnerer settings for begge platformer
  notificationDetails() {
    return const NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }
// Viser en lokal meddelelse med givet id, titel, indhold og payload
  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails());
  }
//Fremtidige notifikationerns metode
  Future scheduleNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payLoad,
      required DateTime scheduledNotificationDateTime, required Duration interval}) async {
    return notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }
}