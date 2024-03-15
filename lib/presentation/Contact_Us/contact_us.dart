import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contact_us extends StatefulWidget {
  @override
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
          title: Text('Contact Us',
           style: TextStyle(fontSize: 25.0,color: Colors.black),
        ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Feel free to contact us!',
                  style: TextStyle(fontSize: 25.0,color: Colors.black),
                ),
                Text(
                  'We will get back to you as soon as possible.',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: problemController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Describe your problem',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle the send button click
                    sendForm();
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, 
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Send', style: TextStyle(color: Colors.white)),
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

      // Form successfully submitted to Firebase Realtime Database
      print('Form submitted successfully');
      // You can add additional logic here, such as showing a confirmation message
    } catch (error) {
      // An error occurred during the form submission
      print('Error during form submission: $error');
      // You can add error handling logic here
    }
  }
}
