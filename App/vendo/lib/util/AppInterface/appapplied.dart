import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApprovedPage extends StatefulWidget {
  const ApprovedPage({Key? key}) : super(key: key);

  @override
  State<ApprovedPage> createState() => _ApprovedPageState();
}

class _ApprovedPageState extends State<ApprovedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SvgPicture.asset(
          "assets/images/undraw_order_confirmed_re_g0if.svg"
        ),
      ),
    ); 
  }
}
