import 'package:flutter/material.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class VendorCard extends StatelessWidget {
  const VendorCard(
      {Key? key,
      required this.location,
      required this.photo,
      required this.name})
      : super(key: key);

  final String location;
  final String photo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image(
                      image: NetworkImage(photo),
                      width: 100,
                      fit: BoxFit.fitHeight,
                    ),
                    Text("Name: "),
                    Text(name),
                  ],
                ),
                verticalSpaceSmall,
                Row(
                  children: [Text("Location: "), Text(location)],
                ),
                verticalSpaceSmall
              ],
            ),
          ),
        ),
      ),
    );
  }
}
