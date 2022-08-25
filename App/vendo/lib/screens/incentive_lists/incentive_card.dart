import 'package:flutter/material.dart';

import '../../routes.dart';

class IncentiveCard extends StatelessWidget {
  const IncentiveCard(
      {Key? key,
      required this.incentiveTopic,
      required this.incentiveDescription})
      : super(key: key);

  final String incentiveTopic;
  final String incentiveDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, left: 8, bottom: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(Routes.incentiveDetails),
        child: Material(
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Colors.grey[100]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        incentiveTopic,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          incentiveDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
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
    );
  }
}
