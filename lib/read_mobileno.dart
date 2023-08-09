
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_number/mobile_number.dart';


class ReadMobileNumber extends StatefulWidget {
  @override
  _ReadMobileNumberState createState() => _ReadMobileNumberState();
}

class _ReadMobileNumberState extends State<ReadMobileNumber>  {
  String _mobileNumber = '';
  List<SimCard> _simCards = [];

  // Method to fetch mobile number and SIM card information
  void _fetchMobileNumberAndSimCards() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }

    try {
      _mobileNumber = (await MobileNumber.mobileNumber)!;
      _simCards = (await MobileNumber.getSimCards) ?? [];
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _fetchMobileNumberAndSimCards,
                child: Text('Fetch Mobile Number and SIM Cards'),
              ),
              SizedBox(height: 20),
              fillCards(),
            ],
          ),
        ),
      ),
    );
  }

  Widget fillCards() {
   if (_simCards.isEmpty) {
      return Text('No SIM cards found on the device.');
    } else {
      List<Widget> widgets = _simCards.take(2).map((SimCard sim) => Text(
        'Sim Card Number: (${sim.countryPhonePrefix}) - ${sim.number}\nCarrier Name: ${sim.carrierName}\nCountry Iso: ${sim.countryIso}'
      )).toList();
      return Column(children: widgets);
    }
  }
}