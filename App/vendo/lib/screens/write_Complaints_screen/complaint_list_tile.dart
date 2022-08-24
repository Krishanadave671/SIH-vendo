import 'package:flutter/material.dart';
import 'package:vendo/models/vendorComplainsModel/vendor_complaints.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import '../../util/AppInterface/ui_helpers.dart';

class ComplaintListTile extends StatelessWidget {
  const ComplaintListTile({
    Key? key,
    required this.model,
  }) : super(key: key);
  final VendorComplaintModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //color: colors.primary,
          color: Colors.orange,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  children: [
                    AppText.containerText("Complaint Type: "),
                    const SizedBox(
                      width: 10,
                    ),
                    AppText.containerText(model.complaintType[0]),
                  ],
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    AppText.containerText("Complaint Date: "),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: AppText.containerText(
                        model.complaintDate.toString(),
                        isSingleLined: 1,
                      ),
                    ),
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
