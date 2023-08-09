import 'package:flutter/material.dart';
import 'package:flutter_application_1/ContactDetailsPage.dart';
import 'package:flutter_application_1/logs.dart';
import 'package:flutter_application_1/read_accounts.dart';
import 'package:flutter_application_1/read_location.dart';
import 'package:flutter_application_1/read_mobileno.dart';
import 'package:flutter_application_1/read_sms.dart';
import 'package:flutter_application_1/send_sms.dart';
import 'package:flutter_application_1/usage_stats.dart';
import 'Read_apps.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(), // Set HomePage as the initial route
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NextPage()),
                );
              },
              child: Text('Contacts'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CallLogPage()),
                );
              },
              child: Text('Call Log'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SmsViewerPage()), // Navigate to SmsPage
                );
              },
              child: Text('SMS'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Usage()), // Navigate to SmsPage
                );
              },
              child: Text('Apps usage'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReadMobileNumber()), // Navigate to SmsPage
                );
              },
              child: Text('Read sim number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SendSmsPage()), // Navigate to SmsPage
                );
              },
              child: Text('send sms'),
            ),
             SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReadLocation()), // Navigate to SmsPage
                );
              },
              child: Text('get location'),
            ),
              SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen()), // Navigate to SmsPage
                );
              },
              child: Text('Read apps'),
            ),
           
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           AccountListScreen()), // Navigate to SmsPage
                );
              },
              child: Text('Read accounts'),
            ),
          ],
        ),
      ),
    );
  }
}
