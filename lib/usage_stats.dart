import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:usage_stats/usage_stats.dart';



class Usage extends StatefulWidget {
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {
  List<EventUsageInfo> events = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      initUsage();
    });
  }

  Future<void> initUsage() async {
    UsageStats.grantUsagePermission();
    DateTime endDate = DateTime.now();
    DateTime startDate = DateTime(2020, 1, 1, 0, 0, 0);

    List<EventUsageInfo> queryEvents =
        await UsageStats.queryEvents(startDate, endDate);

    this.setState(() {
      events = queryEvents.reversed.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Usage Stats"),
        ),
        body: Container(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(events[index].packageName ?? 'Unknown Package'),
                subtitle: Text(
                  "Last time used: ${DateTime.fromMillisecondsSinceEpoch(int.parse(events[index].timeStamp ?? '0')).toIso8601String()}"),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: events.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            initUsage();
          },
          child: Icon(
            Icons.refresh,
          ),
          mini: true,
        ),
      ),
    );
  }
}