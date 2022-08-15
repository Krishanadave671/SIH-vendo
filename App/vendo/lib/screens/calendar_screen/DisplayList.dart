import 'package:flutter/material.dart';
import 'package:vendo/screens/calendar_screen/DisplayCard.dart';

import '../../models/calendar_display_list.dart';

class DisplayList extends StatefulWidget {
  const DisplayList({Key? key}) : super(key: key);

  @override
  State<DisplayList> createState() => _DisplayListState();
}

class _DisplayListState extends State<DisplayList> {
  List<DisplayListModel> content = [
    DisplayListModel("kasunvaiurniruevnkl", "8 00 pm"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: content.length,
            itemBuilder: ((context, index) {
              return DisplayCard(
                  Location: content[index].location, Time: content[index].time);
            })),
      ),
    );
  }
}
