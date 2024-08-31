import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  static const route = '/notification-screen';

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    // Retrieve the notification message from the route arguments
    final RemoteMessage? message = ModalRoute.of(context)?.settings.arguments as RemoteMessage?;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: message == null
              ? const Center(child: Text('No notification data available.'))
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.notification?.title != null)
                Text(
                  'Title: ${message.notification!.title!}',  // Non-null assertion used with safe check
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              if (message.notification?.body != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Body: ${message.notification!.body!}',  // Non-null assertion used with safe check
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              if (message.data.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Data: ${message.data.toString()}',  // Convert map to string for display
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
