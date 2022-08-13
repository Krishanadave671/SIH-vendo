import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

class Servicescard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String serviceName;
  const Servicescard({
    Key? key,
    required this.color,
    required this.icon,
    required this.serviceName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
            width: 100,
            height: 75,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                AppText.caption(serviceName),
              ],
            )),
      ),
    );
  }
}
