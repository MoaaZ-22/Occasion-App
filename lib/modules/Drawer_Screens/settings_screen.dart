// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('Settings',
                style: TextStyle(
                  color: Color(0xffBB2036),
                ),
              )),
              leading:IconButton(
                icon: const Icon(Icons.arrow_back,
                  color: Color(0xffBB2036),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
      body: Column(
      children: [
        SizedBox(height:20),

        TextFormField(
          controller: nameController,
          keyboardType: TextInputType.name,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
            labelStyle: TextStyle(
              color: Color(0xffBB6D78),
              fontWeight: FontWeight.bold,
            ),
            labelText: 'Email',
            prefixIcon: Icon(
              Icons.person,
              color: Color(0xffBB6D78),
            ),
          )),

        const SizedBox(height:20),

        TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            decoration: const InputDecoration(
              labelStyle: TextStyle(
                color: Color(0xffBB6D78),
                fontWeight: FontWeight.bold,
              ),
              labelText: 'User Name',
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xffBB6D78),
              ),
            )),
        const SizedBox(height:20),

        ElevatedButton(
          child: const Text(
            'Update',
            style: TextStyle(
              color: Color(0xffBB2036),
              fontSize: 10.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: const BorderSide(
                width: 2,
                color: Color(0xffBB2036),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(5)),
          onPressed: () {},
        ),
    ]




      ),
    );
  }
}
