import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:vendo/Screens/registration/space_allocation_list.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppFonts/styles.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';
import '../../routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SpaceAllocation extends ConsumerStatefulWidget {
  const SpaceAllocation({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SpaceAllocationState();
}

String dropDownValue = "FoodVendor";

final dropDownProvider = StateProvider<String>((ref) {
  return dropDownValue;
});

String location = '';

final locationProvider = StateProvider((ref) {
  return location;
});

class _SpaceAllocationState extends ConsumerState<SpaceAllocation> {
  double _currentSliderValue = 20;

  String locationSend = '';

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"),
      ),
    );
    print("wowow34oow ${result.city.name.toString()}");

    locationSend = result.city.name.toString();
    print(locationSend);
    ref.watch(locationProvider.notifier).state =
        result.formattedAddress.toString();
  }

  void onContinue() {
    var vendordata = ref.read(vendordetailsProvider);
    vendordata.vendorcategory = dropDownValue;
    print("hii ${ref.read(locationProvider)}");
    vendordata.shoplocation = locationSend;
    vendordata.taxlocation = 10000;
    log(vendordata.toJson().toString());
    print(" $dropDownValue , $_currentSliderValue ");
  }

  @override
  Widget build(BuildContext context) {
    String _location = ref.watch(locationProvider);

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
                              hintText: ref.watch(locationProvider),
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
                            value: ref.read(dropDownProvider.notifier).state,
                            icon: const Icon(Icons.arrow_drop_down),
                            elevation: 16,
                            style: const TextStyle(
                              color: colors.kcPrimaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            onChanged: (String? newValue) {
                              ref.read(dropDownProvider.notifier).state =
                                  newValue!;
                            },
                            items: <String>[
                              'FoodVendor',
                              'ElectronicsVendor',
                              'UtensilsVendor'
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
                        Navigator.of(context).pushNamed(
                          Routes.spaceallocationList,
                          arguments: SpaceAllocationListArguments(
                            city: locationSend,
                          ),
                        );
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
