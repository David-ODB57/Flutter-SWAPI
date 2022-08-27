import 'package:flutter/material.dart';
import 'package:flutter_swapi/services/local_notification.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifications Demo',
          style:  TextStyle(color: Colors.yellow),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Il suffit de cliquer les boutons pour déclencher une notification',
                    style: TextStyle(fontSize: 20.0, color: Colors.yellow),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                          id: 0,
                          title: 'Notification Simple',
                          body: 'Une simple notification');
                    },
                    child: const Text('Notification Local', style: TextStyle(color: Colors.white),),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showScheduledNotification(
                        id: 0,
                        title: 'Notification Planifié',
                        body: 'Une notification planifié',
                        seconds: 4,
                      );
                    },
                    child: const Text('Notification planifiée (4sec)', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


