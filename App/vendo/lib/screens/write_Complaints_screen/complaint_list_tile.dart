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
                        AppText.bodyBold("Complaint Type: "),
                        const SizedBox(
                          width: 10,
                        ),
                        AppText.body(model.complaintType.toString()),
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        AppText.bodyBold("Complaint Date: "),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: AppText.body(
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
        ),
      ),
    );
  }
}
