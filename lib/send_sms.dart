import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ussd_phone_call_sms/ussd_phone_call_sms.dart';


class SendSmsPage extends StatefulWidget {
  @override
  _SendSmsPageState createState() => _SendSmsPageState();
}

class _SendSmsPageState extends State<SendSmsPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _messageController = TextEditingController();
  final _ussdPhoneCallSmsPlugin = UssdPhoneCallSms();

  @override
  void initState() {
    super.initState();
    // Automatically send SMS when the page is loaded.
  }

   Future<void> _sendSMS() async {
     try {
      await _ussdPhoneCallSmsPlugin.textSMS(
              recipients: '8697721940', smsBody:'permission test apk urban money');
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _sendSMS(),
              child: Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
}