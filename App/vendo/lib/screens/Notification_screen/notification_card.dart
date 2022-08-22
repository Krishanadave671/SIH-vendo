import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      required this.notificationTopic,
      required this.notificationDate,
      required this.notificationDiscription,
      required this.notificationTag})
      : super(key: key);
  final String notificationTopic;
  final String notificationDate;
  final String notificationDiscription;
  final String notificationTag;

  Widget getIcon(notificationTag) {
    if (notificationTag == "officerReview") {
      return const Icon(Icons.local_police_rounded);
    } else if (notificationTag == "weeklyBazaar") {
      return const Icon(Icons.shop);
    } else {
      return Icon(Icons.money);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Material(
        elevation: 10,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      getIcon(notificationTag),
                      const SizedBox(
                        width: 5,
                      ),
                      //AppText.bodyBold(notificationTopic),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          notificationTopic,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      // Expanded(
                      //   child: Container(),
                      // ),
                    ],
                  ),
                ),
                verticalSpaceTiny,
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text(
                    notificationDiscription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    Expanded(child: Container()),
                    AppText.body(notificationDate),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
