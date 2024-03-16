import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<Contact_us> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact Us',
           style: TextStyle(fontSize: 25.0,color: Colors.black),
        ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Feel free to contact us!',
                  style: TextStyle(fontSize: 25.0,color: Colors.black),
                ),
                const Text(
                  'We will get back to you as soon as possible.',
                  style: TextStyle(fontSize: 20.0),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: problemController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Describe your problem',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle the send button click
                    sendForm();
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Send', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> sendForm() async {
    try {
      await FirebaseFirestore.instance.collection('ContactUs').add({
        'name': nameController.text,
        'email': emailController.text,
        'Problem': problemController.text,
      });

      
    } catch (error) {
      // An error occurred during the form submission
      print('Error during form submission: $error');
      // You can add error handling logic here
    }
  }
}
