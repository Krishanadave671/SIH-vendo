import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/services/dio_client.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import '../../util/AppFonts/app_text.dart';

class ApprovalPage extends ConsumerStatefulWidget {
  const ApprovalPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends ConsumerState<ApprovalPage> {
  // String? isApproved;
  Future<void> getStatus(WidgetRef ref) async {
    final _apiservice = ref.watch(apiserviceProvider);
    await _apiservice.getUserDataFromId(context, ref);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isApproved = "approved";
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          // await getStatus(ref);

          isApproved == "approved";
          log(isApproved.toString());
        },
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25, top: 25),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                  padding: EdgeInsets.all(0),
                  child: AppText.headingThree("Remaining Steps")),
              verticalSpaceSmall,
              Container(
                  padding: EdgeInsets.all(0),
                  child: AppText.body(
                      "You have completed the\nbackground check process.")),
              verticalSpaceMedium,
              Container(
                  padding: EdgeInsets.all(0),
                  child: AppText.body2("Submitted")),
              verticalSpaceMedium,
              Column(
                children: [
                  ListTile(
                    leading: (isApproved == "approved")
                        ? Icon(
                            Icons.check_circle,
                            color: colors.primary,
                          )
                        : (isApproved == "rejected")
                            ? Icon(
                                Icons.warning,
                                color: Colors.red,
                              )
                            : Icon(Icons.timer),
                    title: AppText.body2("Aadhar Card"),
                    subtitle: (isApproved == "rejected")
                        ? AppText.body(
                            "rejected",
                            color: Colors.red,
                          )
                        : AppText.body("awaiting"),
                    trailing: (isApproved == "approved")
                        ? null
                        : Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  ListTile(
                    leading: (isApproved == "approved")
                        ? Icon(
                            Icons.check_circle,
                            color: colors.primary,
                          )
                        : (isApproved == "rejected")
                            ? Icon(
                                Icons.warning,
                                color: Colors.red,
                              )
                            : Icon(Icons.timer),
                    title: AppText.body2("Pan Card"),
                    subtitle: (isApproved == "rejected")
                        ? AppText.body(
                            "rejected",
                            color: Colors.red,
                          )
                        : AppText.body("awaiting"),
                    trailing: (isApproved == "approved")
                        ? null
                        : Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                ],
              ),
              verticalSpaceLarge,
              verticalSpaceLarge,
              GestureDetector(
                onTap: () async {
                  if (isApproved == "approved") {
                    final vendor = ref.watch(vendordetailsProvider);

                    final _apiservice = ref.watch(apiserviceProvider);
                    await _apiservice.login(
                        vendor.phone, vendor.password, context, ref);

                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.mainPage, (route) => false);
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: (isApproved == "approved")
                        ? colors.primary
                        : colors.kcGreyBackground,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppText.body2(
                    "Continue",
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
