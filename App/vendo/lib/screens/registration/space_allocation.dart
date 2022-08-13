import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vendo/Screens/registration/services/dio_client.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppFonts/styles.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class SpaceAllocation extends StatefulWidget {
  const SpaceAllocation({Key? key}) : super(key: key);

  @override
  State<SpaceAllocation> createState() => _SpaceAllocation();
}

class _SpaceAllocation extends State<SpaceAllocation> {
  BasicOptions? _passport = BasicOptions.yes;
  BasicOptions? _election = BasicOptions.yes;
  BasicOptions? _liscense = BasicOptions.yes;
  String? dropdownValue = null;
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
            bottom: 20,
            left: 0,
            right: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: AppText.headingOne("Register"),
              ),
              verticalSpaceMedium,
              SizedBox(
                height: 50,
                width: 350,
                child: DecoratedBox(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppText.headingTwo(
                        "Shop Details",
                        color: colors.backgroundColor,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        bottomEnd: Radius.circular(20)),
                  ),
                ),
              ),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DecoratedBox(
                      decoration: borderBoxOutline,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: const TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Enter location of shop',
                              hintText: 'location'),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration: borderBoxOutline,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            hint: AppText.body("Category of shop"),
                            value: dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: TextStyle(
                              color: colors.kcPrimaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Food Vendor',
                              'Electronics Vendor',
                              'Utensils Vendor'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                    verticalSpaceLarge,
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: AppText.subheading("Location Tax Range"),
                    ),
                    verticalSpaceSmall,
                    Slider(
                      activeColor: colors.primary,
                      inactiveColor: colors.primary,
                      thumbColor: colors.primary,
                      value: _currentSliderValue,
                      max: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    verticalSpaceLarge,
                    GestureDetector(
                      onTap: () {
                        DioClient dioClient = DioClient();
                        print(dioClient.getvendingZones().toString()) ; 
                      },
                      child: Center(
                        child: SizedBox(
                          height: 50,
                          width: 300,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: colors.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                AppText.body(
                                  "Search Location",
                                  color: colors.backgroundColor,
                                ),
                                Icon(
                                  Icons.search,
                                  color: colors.backgroundColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.only(right: 60, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 70,
                height: 50,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Icon(
                    Icons.arrow_forward,
                    size: 50,
                    color: colors.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        elevation: 0,
      ),
    );
  }
}

enum BasicOptions {
  yes,
  no,
}
