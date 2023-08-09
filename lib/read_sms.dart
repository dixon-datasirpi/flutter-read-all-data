import 'package:flutter/material.dart';

import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';

class SmsViewerPage extends StatefulWidget {
  @override
  _SmsViewerPageState createState() => _SmsViewerPageState();
}

class _SmsViewerPageState extends State<SmsViewerPage> {
  final SmsQuery _query = SmsQuery();
  List<SmsMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadSms();
  }

  Future<void> _loadSms() async {
   SmsQuery query = SmsQuery();

  // Get a list of all SMS messages.
  List<SmsMessage> messages = await query.getAllSms;
    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SMS Viewer'),
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final message = _messages[index];
          return ListTile(
            title: Text('From: ${message.address}'),
            subtitle: Text('Message: ${message.body}'),
          );
        },
      ),
    );
  }
}
