import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(

appBar:  AppBar(title: const Text("Add Contact"),),


    );
  }
}