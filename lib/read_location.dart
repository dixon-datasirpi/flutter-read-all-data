import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';




class ReadLocation  extends StatefulWidget {
  @override
  _ReadLocationstate createState() => _ReadLocationstate();
}

class _ReadLocationstate extends State<ReadLocation> {
  String _locationInfo = 'Location data will appear here';

  Future<void> _getPreciseLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,  // Use best for precise location
      );
      setState(() {
        _locationInfo =
            'Latitude: ${position.latitude}\nLongitude: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _locationInfo = 'Error getting location: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Precise Location Reader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _locationInfo,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getPreciseLocation,
              child: Text('Get Precise Location'),
            ),
          ],
        ),
      ),
    );
  }
}