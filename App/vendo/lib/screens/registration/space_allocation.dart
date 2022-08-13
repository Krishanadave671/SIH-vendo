import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppFonts/styles.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

import '../../routes.dart';

class SpaceAllocation extends StatefulWidget {
  const SpaceAllocation({Key? key}) : super(key: key);

  @override
  State<SpaceAllocation> createState() => _SpaceAllocation();
}

class _SpaceAllocation extends State<SpaceAllocation> {
  String? _dropdownValue;
  double _currentSliderValue = 20;
  String _location = '';

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"),
      ),
    );
    print(result.city.name.toString());
    setState(() {
      //get whatever data about gmaps you want here
      _location = result.city.name.toString();
    });
  }

  void onContinue() {
    print(" $_location , $_dropdownValue , $_currentSliderValue ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
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
            top: MediaQuery.of(context).size.height * 0.01,
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
                  decoration: const BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(20),
                        bottomEnd: Radius.circular(20)),
                  ),
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
                        child: TextField(
                          onChanged: (value) => value,
                          readOnly: true,
                          onTap: () {
                            showPlacePicker();
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Location of Shop',
                              hintText: _location,
                              hintStyle: body1Style),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DecoratedBox(
                        decoration: borderBoxOutline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DropdownButton<String>(
                            hint: AppText.body("Category of shop"),
                            value: _dropdownValue,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(
                              color: colors.kcPrimaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                _dropdownValue = newValue!;
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
                      divisions: 10,
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
                        onContinue();
                        Navigator.of(context).pushNamed(Routes.spaceallocationList);
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
                                const Icon(
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
    );
  }
}

enum BasicOptions {
  yes,
  no,
}
