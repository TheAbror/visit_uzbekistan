// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // ignore: depend_on_referenced_packages
// import 'package:timezone/timezone.dart' as tz;

// class Noti {
//   final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();
//   //
//   static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
//     var androidInitialize = const AndroidInitializationSettings('transparent');
//     var iOSInitialize = const DarwinInitializationSettings();

//     var initializeSeettings = InitializationSettings(
//       android: androidInitialize,
//       iOS: iOSInitialize,
//     );

//     await FlutterLocalNotificationsPlugin().initialize(initializeSeettings);
//   }

//   static Future showLocalNotification(
//       {var id = 0,
//       required String title,
//       required String body,
//       var payload,
//       required FlutterLocalNotificationsPlugin fln}) async {
//     AndroidNotificationDetails androidNotificationDetails = const AndroidNotificationDetails(
//       "high_importance_channel",
//       "channel_name",
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.high,
//     );

//     var not = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: const DarwinNotificationDetails(),
//     );

//     await fln.show(0, title, body, not);
//   }

//   Future scheduleNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payLoad,
//     required DateTime scheduledNotificationDateTime,
//   }) async {
//     return notificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.now(tz.local).add(
//           const Duration(seconds: 15),
//         ),
//         await notificationDetails(),
//         androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//         uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);
//   }

//   notificationDetails() {
//     return const NotificationDetails(
//       android: AndroidNotificationDetails(
//         'high_importance_channel',
//         'channel_name',
//         importance: Importance.max,
//       ),
//       iOS: DarwinNotificationDetails(),
//     );
//   }
// }
