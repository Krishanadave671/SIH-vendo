import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Resources page")),
    );
  }
}
