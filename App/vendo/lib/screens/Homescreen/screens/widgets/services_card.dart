import 'package:flutter/material.dart';
import 'package:vendo/util/AppFonts/app_text.dart';

class Servicescard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String serviceName;
  final void Function() onTap;
  const Servicescard({
    Key? key,
    required this.color,
    required this.icon,
    required this.serviceName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: PhysicalModel(
        color: Colors.white,
        elevation: 4,
        shadowColor: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: GestureDetector(
          onTap: onTap,
          child: SizedBox(
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
      ),
    );
  }
}
