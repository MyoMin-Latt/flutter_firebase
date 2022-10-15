import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_example/pages/stream_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const GetMaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(StreamPage());
                },
                child: const Text('Stream Page')),
          ],
        ),
      ),
    );
  }
}
