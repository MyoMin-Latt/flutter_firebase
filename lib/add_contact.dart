import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/model/person.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({Key? key}) : super(key: key);

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _addressController = TextEditingController();
  final CollectionReference<Person> _contact = FirebaseFirestore.instance
      .collection('contact')
      .withConverter<Person>(
          fromFirestore: (snapshot, _) => Person.fromMap(snapshot.data()!),
          toFirestore: (person, _) => person.toMap());
  bool _loading = false;
  bool _success = false;
  bool _error = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contact to Firestore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(height: 10),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                label: Text('Name'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                hintText: 'Enter your age',
                label: Text('Age'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: const InputDecoration(
                hintText: 'Enter your address',
                label: Text('Address'),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addContact,
              child: const Text('Save Contact'),
            ),
            const SizedBox(height: 10),
            (_loading)
                ? const CircularProgressIndicator.adaptive()
                : const SizedBox(),
            (_error)
                ? const Center(
                    child: Text('Error'),
                  )
                : const SizedBox(),
            (_success)
                ? const Center(
                    child: Text('Success'),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> _addContact() async {
    setState(() {
      _loading = true;
      _success = false;
      _error = false;
    });
    _contact
        .add(Person(
      _nameController.text,
      _ageController.text,
      _addressController.text,
      DateTime.now().millisecondsSinceEpoch,
    ))
        .then((value) {
      setState(() {
        _loading = false;
        _success = true;
      });
    }).catchError((e) {
      setState(() {
        _loading = false;
        _error = true;
      });
    }).whenComplete(() {
      _nameController.text = '';
      _ageController.text = '';
      _addressController.text = '';
    });
  }
}
