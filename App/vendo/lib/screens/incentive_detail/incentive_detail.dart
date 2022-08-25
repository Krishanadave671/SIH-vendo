import 'package:flutter/material.dart';

class IncentiveDetail extends StatefulWidget {
  const IncentiveDetail({Key? key}) : super(key: key);

  @override
  State<IncentiveDetail> createState() => _IncentiveDetailState();
}

class _IncentiveDetailState extends State<IncentiveDetail> {
  final String _quote = "Together we can go higher, Keep working hard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 200),
                  child: Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://learn.g2.com/hs-fs/hubfs/iStock-1227315898.jpg?width=5000&name=iStock-1227315898.jpg"),
                          fit: BoxFit.fitWidth),
                    ),
                  ),
                ),
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Image(
                                image:
                                    AssetImage("assets/images/incentive.png"),
                                height: 50,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 12.0, left: 5),
                                child: Text(
                                  "Incentives",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  ),
                                ),
                              ),
                              Expanded(child: Container()),
                              // GestureDetector(
                              //   child: const Icon(
                              //     Icons.logout,
                              //     color: Colors.white,
                              //   ),
                              //   onTap: () {},
                              // )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 5,
                        )),
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            _quote,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // const SizedBox(
                          //   height: 5,
                          // ),
                          Expanded(child: Container()),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, bottom: 5),
                            child: Row(
                              children: [
                                Expanded(child: Container()),
                                const Text(
                                  "Min Credit: ",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.amber),
                                ),
                                const Text(
                                  "35",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.amber),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
              ),
              child: Row(
                children: const [
                  Text(
                    "Incentive Name",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      "Ministry of Housing & Urban Affairs launched a scheme PM Street Vendor's AtmaNirbhar Nidhi (PM SVANidhi) to empower Street Vendors by not only extending loans to them, but also for their holistic development and economic upliftment. The scheme intends to facilitate collateral free working capital loans of up to INR10,000/- of one-year tenure, to approximately 50 lakh street vendors, to help resume their businesses in the urban areas, including surrounding peri-urban/rural areas.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
