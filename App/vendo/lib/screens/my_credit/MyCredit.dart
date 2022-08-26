import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

class MyCreditScore extends StatefulWidget {
  const MyCreditScore({Key? key}) : super(key: key);

  @override
  State<MyCreditScore> createState() => _MyCreditScoreState();
}

class _MyCreditScoreState extends State<MyCreditScore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/images/credit.png"),
                      width: 50,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "My Credit Score",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.white, width: 5)),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      const Text(
                        "Current Score: ",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      const Text(
                        "35",
                        style: TextStyle(color: Colors.white, fontSize: 28),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              )
            ],
          ),
          verticalSpaceMedium,
          AppText.headingThree(
            "About the System",
          ),
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20))),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "1) Each positive Review adds a credit to your profile\n2) Each negative review costs a credit point.\n3) Credit system is a time independent grading system.) ",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 221, 221, 120),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/images/speedometer.png"),
                      width: 40,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                          "Maintain a good credit score to to avail for the incentives and take benefits."),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
