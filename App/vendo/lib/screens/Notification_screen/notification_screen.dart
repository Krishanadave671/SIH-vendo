import 'package:flutter/material.dart';
import 'package:vendo/screens/Notification_screen/notification_card.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

import '../../models/notificationModel.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel("Vendors can avail for benefits ", "23 july 2022",
        "https://imageio.forbes.com/specials-images/imageserve/5f962df3991e5636a2f68758/0x0.jpg?format=jpg&crop=812,457,x89,y103,safe&width=1200"),
    NotificationModel("Vendors can avail for benefits ", "23 july 2022",
        "https://assets.devfolio.co/hackathons/d2e152245d8146898efc542304ef6653/assets/cover/694.png"),
    NotificationModel("Vendors can avail for benefits ", "23 july 2022",
        "https://assets.devfolio.co/hackathons/d2e152245d8146898efc542304ef6653/assets/cover/694.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                children: [
                  AppText.headingOne("Notifications"),
                ],
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Container(
                height: 5,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey,
              ),
            ),
            verticalSpaceMedium,
            ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: notifications.length,
                itemBuilder: ((context, index) {
                  return NotificationCard(
                    notificationTopic: notifications[index].topic,
                    notificationDate: notifications[index].releaseDate,
                    notificationImage: notifications[index].image,
                  );
                }))
          ],
        ),
      ),
    );
  }
}
