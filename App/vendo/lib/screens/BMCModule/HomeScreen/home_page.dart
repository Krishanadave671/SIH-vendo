import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendo/screens/BMCModule/HomeScreen/vendor_card.dart';

import '../../../models/vendor_visit_list/vendor_visit_list.dart';

class BMCHomePage extends StatefulWidget {
  const BMCHomePage({Key? key}) : super(key: key);

  @override
  State<BMCHomePage> createState() => _BMCHomePageState();
}

class _BMCHomePageState extends State<BMCHomePage> {
  List<VendorListModel> vendorList = [
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
    VendorListModel("mera bhai", "sector 4, kharghar, navi mumbai",
        "https://img.redbull.com/images/c_fill,w_1200,h_630,g_auto,f_auto,q_auto/redbullcom/2022/3/23/rz5zlnruxjvzl1shiubi/max-verstappen-rbr"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 400,
              decoration: BoxDecoration(color: Colors.amber),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: vendorList.length,
                  itemBuilder: ((context, index) {
                    return VendorCard(
                        location: vendorList[index].location,
                        photo: vendorList[index].vendorPhoto,
                        name: vendorList[index].vendorName);
                  })),
            ),
          ],
        ),
      ),
    );
  }
}
