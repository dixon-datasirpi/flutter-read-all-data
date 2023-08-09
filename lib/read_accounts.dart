import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:account_picker/account_picker.dart';

class AccountListScreen extends StatefulWidget {
  @override
  _AccountListScreenState createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  Future<void> _getAccounts() async {
    try {
      final EmailResult? emailResult = await AccountPicker.emailHint();
      setState(() {
      });
    } catch (e) {
      print(e.toString());
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
            ElevatedButton(
              onPressed: _getAccounts,
              child: Text('Get Accounts'),
            ),
          ],
        ),
      ),
    );
  }
}
