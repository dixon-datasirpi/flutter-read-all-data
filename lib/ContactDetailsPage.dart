import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';





class NextPage extends StatefulWidget {
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  List<Contact> _contacts = [];

  void _getContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    setState(() {
      _contacts = contacts.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: ListView.builder(
        itemCount: _contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_contacts[index].displayName ?? ''),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getContacts, // Call the _getContacts function
        child: Icon(Icons.person),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white, // Display an add icon
      ),
    );
  }
}

