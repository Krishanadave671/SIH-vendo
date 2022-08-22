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
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
    NotificationModel(
        "Vendors can avail for benefits ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "incentiveEligibility"),
    NotificationModel(
        "Vendors can avail for benefits ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "weeklyBazaar"),
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
    NotificationModel(
        "Vendors can avail for benefits djalknl kaldn klandglkjn klajglklakjf kjalk ",
        "23 july 2022",
        "lkakvnaid ijaoifnkl ijhoaeiknflka ajois jhif kaesfjoweijf askjfasdfkln kijofgi df kjd ikjgoire dgjihaasdklf kd kadsfk kndknj kdk",
        "officerReview"),
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
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  itemBuilder: ((context, index) {
                    return NotificationCard(
                      notificationTopic: notifications[index].topic,
                      notificationDate: notifications[index].releaseDate,
                      notificationDiscription: notifications[index].discription,
                      notificationTag: notifications[index].tag,
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
