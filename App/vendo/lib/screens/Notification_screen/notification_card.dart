import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      required this.notificationTopic,
      required this.notificationImage,
      required this.notificationDate})
      : super(key: key);
  final String notificationTopic;
  final String notificationImage;
  final String notificationDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Material(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppText.body(notificationTopic),
                      ],
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        AppText.body(notificationDate),
                      ],
                    ),
                  ],
                ),
              ),
              // Container(
              //   width: 50,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.fitHeight,
              //         image: NetworkImage(notificationImage)),
              //   ),
              // ),
              Image(
                image: NetworkImage(notificationImage),
                width: 70,
                fit: BoxFit.fitHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
