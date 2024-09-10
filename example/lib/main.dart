import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_convert_helper/date_convert_helper.dart';
import 'package:flutter/material.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(
    title: "Example of Date Converter Helper",
    debugShowCheckedModeBanner: false,
    home: Example(),
  ));
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  /// -------- activity time helper --------------
  String activityTimeHelperExample = ActivityTimeHelper.userOnlineActivity("2024-09-10T18:46:26.266");
  
  /// -------- timestamp date helper ------------
  final timestamp = TimeStampDateHelper.formatTimestampDateTime(
    time: Timestamp.now(),
    formatPattern: "E"
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// ---------- activity time helper example text widget
              Text(
                "Activity Time Helper example: $activityTimeHelperExample",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),
              ),
              const SizedBox(height: 12),
              
              /// ---------- time stamp date helper example text widget
              Text(
                "Timestamp Date Helper example: $timestamp",
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

