import 'package:flutter/material.dart';
import 'package:vendo/screens/registration/documentarty_evidence.dart';
import 'package:vendo/screens/registration/nationality_evidence.dart';
import 'package:vendo/screens/registration/space_allocation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SpaceAllocation());
  }
}
