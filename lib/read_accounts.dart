import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';


class AccountListScreen extends StatefulWidget {
  @override
  _AccountListScreenState createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  var accountDetails = "";
  var accountList = [];
  Future<void> getAccountDetails() async {
    const platform =
        MethodChannel('READ_ACCOUNTS'); // Replace with your channel name
    try {
      final result = await platform.invokeMethod('readAccountInfo');
       setState(() {
       accountDetails = result["accounts"];
      });
     
    } on PlatformException catch (e) {
      print("Failed to read account info: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account List'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              accountDetails,
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => getAccountDetails(),
              child: Text('Get Accounts'),
            ),
          ],
        ),
      ),
    );
  }
}
