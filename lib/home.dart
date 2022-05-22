import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/add_contact.dart';
import 'package:firebase_example/model/person.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final Stream<QuerySnapshot<Person>> _contactDocs = FirebaseFirestore.instance
      .collection('contact')
      .withConverter<Person>(
          fromFirestore: (snapshot, _) {
            return Person.fromMap(snapshot.data()!);
          },
          toFirestore: (person, _) => person.toMap())
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FireBase Tutorial'),
      ),
      body: StreamBuilder<QuerySnapshot<Person>>(
        stream: _contactDocs,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<QueryDocumentSnapshot<Person>>? contactDocsList =
                snapshot.data?.docs;
            if (snapshot.data != null) {
              return ListView.builder(
                  itemCount: contactDocsList?.length,
                  itemBuilder: (context, position) {
                    QueryDocumentSnapshot<Person>? contactDoc =
                        contactDocsList?[position];
                    return ListTile(
                      title: Text(contactDoc?.data().name ?? ''),
                      subtitle: Text(contactDoc?.data().address ?? ''),
                      trailing: Text(contactDoc?.data().age ?? ''),
                    );
                  });
            } else {
              return const Text('Empty Data');
            }
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something Wrong"));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AddContact();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
