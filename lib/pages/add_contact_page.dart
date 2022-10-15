import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_example/core/validator/validators.dart';
import 'package:firebase_example/pages/stream_page.dart';
import 'package:firebase_example/model/person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController1 = TextEditingController();
  final phoneController2 = TextEditingController();
  final homeNoController = TextEditingController();
  final streetController = TextEditingController();
  final housingController = TextEditingController();
  final condoController = TextEditingController();
  final townshipController = TextEditingController();
  final cityController = TextEditingController();
  final emailController = TextEditingController();
  final latitudeController = TextEditingController();
  final longitudeController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Name
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                    label: Text('Name'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),

                // password
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    label: Text('password'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),

                // Phone1
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController2,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone1',
                    label: Text('Phone1'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),

                // Phone2
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneController1,
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone2',
                    label: Text('Phone2'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),

                // Address1
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Your Address'),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: homeNoController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your home no.',
                    label: Text('Home No.'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: streetController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your street.',
                    label: Text('Street'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: housingController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Housing.',
                    label: Text('Housing'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: condoController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Condo.',
                    label: Text('Condo'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: townshipController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your township.',
                    label: Text('Township'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: cityController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your city.',
                    label: Text('City'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),

                const SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your email.',
                    label: Text('Email'),
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                  ),
                  validator: requiredValidator,
                ),
                const SizedBox(height: 10),

                // Save Button
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _addContact();
                    }
                  },
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
      'loc${phoneController1.text}',
      nameController.text,
      phoneController1.text,
      phoneController2.text,
      homeNoController.text,
      streetController.text,
      housingController.text,
      condoController.text,
      townshipController.text,
      cityController.text,
      DateFormat('dd-mm-yyy').format(DateTime.now()),
      DateFormat('dd-mm-yyy').format(DateTime.now()),
      emailController.text,
      latitudeController.text,
      longitudeController.text,
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
      Get.to(StreamPage());
      print('complete');
    });
  }
}
