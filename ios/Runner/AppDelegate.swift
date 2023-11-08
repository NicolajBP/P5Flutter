import UIKit
import Flutter
//nyt import for notifications
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    //plugin for notficiations på iOS
    FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
    GeneratedPluginRegistrant.register(with: registry)}




    GeneratedPluginRegistrant.register(with: self)
    
    // Konfigurer notifikationer for iOS 10 og nyere
     if #available(iOS 10.0, *) {
         UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
      }

    
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
