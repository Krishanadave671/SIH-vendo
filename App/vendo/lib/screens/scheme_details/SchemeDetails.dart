import 'package:flutter/material.dart';
import 'package:vendo/models/governmentSchemeModel/government_scheme_model.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';

import '../../routes.dart';

class SchemeDetails extends StatefulWidget {
  const SchemeDetails({Key? key, required this.governmentSchemeModel})
      : super(key: key);
  final GovernmentSchemeModel governmentSchemeModel;

  @override
  State<SchemeDetails> createState() => _SchemeDetailsState();
}

class _SchemeDetailsState extends State<SchemeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              expandedHeight: 400,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    widget.governmentSchemeModel.schemeImageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    child: Container(
                      width: 150,
                      height: 7,
                      decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.governmentSchemeModel.schemeName,
                    style: TextStyle(fontSize: 20, height: 1.2),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 16.0, right: 20),
                  //   child: Text(
                  //     "National Rural Employment Gaurantee Act",
                  //     style: TextStyle(fontSize: 18, height: 1.2),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Requirements",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.governmentSchemeModel.schemeReq,
                    style: TextStyle(height: 1.6),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Benefits",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.governmentSchemeModel.schemeBenefits,
                    style: TextStyle(height: 1.6),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showSnackBar(context, "succefully applied!!");
                        Navigator.of(context).pushNamed(Routes.mainPage);
                      },
                      child: Text("Apply Now!!"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
