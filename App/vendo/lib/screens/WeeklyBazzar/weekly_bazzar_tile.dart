import 'package:flutter/material.dart';
import 'package:vendo/models/vendorComplainsModel/vendor_complaints.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import '../../util/AppInterface/ui_helpers.dart';

class MyBazzarListTile extends StatelessWidget {
  const MyBazzarListTile({
    Key? key,
    required this.name,
    required this.id,
    required this.status,
  }) : super(key: key);
  final String name;
  final String id;
  final String status;

  Widget statusPill(status) {
    if (status == "approved") {
      return Container(
        width: 110,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          color: Color.fromARGB(255, 200, 230, 201),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              Icon(
                Icons.done,
                color: Colors.green[900],
                size: 20,
              ),
              Text(
                status,
                style: TextStyle(color: Colors.green[900], fontSize: 16),
              ),
            ],
          ),
        ),
      );
    } else if (status == "pending") {
      return Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Colors.yellow[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Icon(
                Icons.hourglass_bottom,
                color: Color.fromARGB(255, 212, 194, 26),
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                status,
                style: const TextStyle(
                    color: Color.fromARGB(255, 212, 194, 26), fontSize: 16),
              ),
            ],
          ),
        ),
      );
    } else if (status == "rejected") {
      return Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: Colors.red[100],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            children: [
              const Icon(
                Icons.do_not_disturb,
                color: Colors.red,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                status,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        width: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: AppText.body(status),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //color: colors.primary,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {},
            child: Material(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        AppText.bodyBold("Bazaar name: "),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText.body(name),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        AppText.bodyBold("Bazaar id: "),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: AppText.body(
                            id,
                            isSingleLined: 1,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(child: Container()),
                          statusPill(status),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
