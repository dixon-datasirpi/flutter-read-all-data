import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

class CallLogPage extends StatefulWidget {
  @override
  _CallLogPageState createState() => _CallLogPageState();
}

class _CallLogPageState extends State<CallLogPage> {
  List<CallLogEntry> _callLogs = [];

  @override
  void initState() {
    super.initState();
    _getCallLogs();
  }

  void _getCallLogs() async {
    Iterable<CallLogEntry> callLogs = await CallLog.get();
    setState(() {
      _callLogs = callLogs.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Log'),
      ),
      body: ListView.builder(
        itemCount: _callLogs.length,
        itemBuilder: (context, index) {
          final call = _callLogs[index];
          return ListTile(
            title: Text(call.name ?? 'Unknown'),
            subtitle: Text(call.number ?? 'No Number'),
            trailing: Text(call.callType.toString() ?? 'Unknown'),
            onTap: () {
              final contactName = call.name ?? 'Unknown';
              final contactNumber = call.number ?? 'No Number';
              final snackBar = SnackBar(
                content: Text('Contact Name: $contactName\nContact Number: $contactNumber'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          );
        },
      ),
    );
  }
}
