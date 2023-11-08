// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // Initialiserer tjenesten og konfigurerer notoficationsindstillinger
//   Future<void> initNotification() async {
//     // Android indstillinger
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('android/app/src/main/res/logo.png');

//     // iOS indstillinger
//     var initializationSettingsIOS = DarwinInitializationSettings(
//         requestAlertPermission: true,
//         requestBadgePermission: true,
//         requestSoundPermission: true,
//         onDidReceiveLocalNotification:
//             (int id, String? title, String? body, String? payload) async {});

//     // Samlet initialiseringsindstillinger for begge platforme (Android og iOS)
//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//     // Initialiserer meddelelsesplugin med indstillinger
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }

//   // Returnerer settings for begge platformer
//   notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }

//   // Viser en lokal meddelelse med givet id, titel, indhold og payload
//   Future showNotification(
//       {int id = 1, String? title, String? body, String? payload}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
// }
 