import 'package:rxdart/subjects.dart';
import 'package:wesave/ressource/export.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
 // DateTime tz = DateTime.now();
 DateTime startDate = DateTime.now().toLocal();
//var date = DateFormat.yMMMd().format(startDate);
  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          'channelId',
          'channelName',
          importance: Importance.max,
        ),
        iOS: IOSNotificationDetails(
        
        ));
  }

  static dynamic init({bool initScheduled = false}) async {
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    await _notifications.initialize(
      settings,
      onSelectNotification: (payload) async {
        onNotifications.add(payload);
      },
    );
  }

  static dynamic showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );
  
  /*static dynamic showScheduledNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledDate,
  }) async =>
      _notifications.zonedSchedule(
        id,
        title,
        body,
        _scheduleDaily(Time(5)),
        tz.TZDateTime.from(scheduledDate, tz.local),
        await _notificationDetails(),
        payload: payload,
        androidAllowWhileIdle: true, 
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time
      );
*/
}
