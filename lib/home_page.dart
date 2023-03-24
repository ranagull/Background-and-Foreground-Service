import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "stop service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsForeground');
              },
              child: const Text("Foreground Service")),
          ElevatedButton(
              onPressed: () {
                FlutterBackgroundService().invoke('setAsBackground');
              },
              child: const Text("Background Service")),
          ElevatedButton(
              onPressed: () async {
                final service = FlutterBackgroundService();
                bool isRunning = await service.isRunning();
                if (isRunning) {
                  service.invoke("stopService");
                } else {
                  service.startService();
                }
                if (!isRunning) {
                  text = "Stop Service";
                } else {
                  text = "Start Service";
                }
                setState(() {});
              },
              child: Text("$text")),
        ],
      ),
    ));
  }
}
