// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:portf/teewhydot/presentation/widgets/reused_widgets/custom_button.dart';

class ContactFormWidget extends StatefulWidget {
  const ContactFormWidget({super.key});

  @override
  _ContactFormWidgetState createState() => _ContactFormWidgetState();
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            style: TextStyle(color: Colors.white),

            decoration: const InputDecoration(labelText: 'Name', labelStyle: TextStyle(color: Colors.white),),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: 'Email', labelStyle: TextStyle(color: Colors.white),),
            style: TextStyle(color: Colors.white),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _messageController,
            style: TextStyle(color: Colors.white),

            decoration: const InputDecoration(labelText: 'Message', labelStyle: TextStyle(color: Colors.white),),
            minLines: 4,
            maxLines: 7,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomButton(
            width: 120,
          height: 50,
          text: 'Send' ,
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _sendEmail();
              }
            },
          ),
        ],
      ),
    );
  }

  void _sendEmail() async {
    final Email email = Email(
      body: _messageController.text,
      subject: 'Contact Form Submission',
      recipients: ['tchipsical@gmail.com'],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      _showSuccessDialog();
    } catch (error) {
      _showErrorDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Your message has been sent.'),
          actions: [
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to send the message.'),
          actions: [
            CustomButton(
              text: 'ok',
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
