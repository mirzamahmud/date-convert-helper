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
  String activityTimeHelperExample = ActivityTimeHelper.userOnlineActivity("2024-09-10T18:46:26.266");

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
              Text(
                activityTimeHelperExample,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

