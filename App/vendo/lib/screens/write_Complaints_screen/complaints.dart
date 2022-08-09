import 'package:flutter/material.dart';

class AddComplaints extends StatefulWidget {
  AddComplaints({Key? key}) : super(key: key);

  @override
  State<AddComplaints> createState() => _AddComplaintsState();
}

class _AddComplaintsState extends State<AddComplaints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Add complaints page")),
    ); 
  }
}
