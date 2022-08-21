import 'package:flutter/material.dart';

class AvailableIncentives extends StatefulWidget {
  const AvailableIncentives({Key? key}) : super(key: key);

  @override
  State<AvailableIncentives> createState() => _AvailableIncentivesState();
}

class _AvailableIncentivesState extends State<AvailableIncentives> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/bgBubble.png"),
            ],
          ),
        ],
      ),
    );
  }
}
