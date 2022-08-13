import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:vendo/models/vendingzone_details.dart';
import 'package:vendo/providers/vending_zoneprovider.dart';

import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

@immutable
class VendingZones {
  final String id;
  final String streetName;
  final String location;
  final String description;
  final String imageFile;
  final int max;
  final String city;
  final String ward;
  final int tax;

  const VendingZones({
    required this.id,
    required this.streetName,
    required this.location,
    required this.description,
    required this.imageFile,
    required this.max,
    required this.city,
    required this.ward,
    required this.tax,
  });
}

class VendingZonesNotifier extends StateNotifier<List<VendingZones>> {
  VendingZonesNotifier() : super([]) {
    getZones();
  }

  void addZone(VendingZones vendingZones) {
    state = [...state, vendingZones];
  }

  void removeZone(String id) {
    state = [
      for (final vendingZones in state)
        if (vendingZones.id != id) vendingZones,
    ];
  }

  void getZones() {
    for (int i = 0; i < 6; i++) {
      String id = '23';
      String streetName = 'kanderpada';
      String location = "34.23323.23";
      String description = "this is a nice place to sell";
      String imageFile = "https://sdfsadf";
      int max = 34;
      String city = "mumbai";
      String ward = "R";
      int tax = 3422;
      final vd = VendingZones(
        id: id,
        streetName: streetName,
        location: location,
        description: description,
        imageFile: imageFile,
        max: max,
        city: city,
        ward: ward,
        tax: tax,
      );

      addZone(vd);
    }
  }
}

class SpaceAllocationListView extends ConsumerWidget {
  const SpaceAllocationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(vendingzonedataProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: AppText.headingThree("Vending Zones"),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.01,
            bottom: 20,
            left: 0,
            right: 20,
          ),
          child: _data.when(
              data: (data) {
                List<VendingzoneModel?> vendingzonelist =
                    data.map((e) => e).toList();
                return ListView.builder(
                  itemCount: vendingzonelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      minVerticalPadding:
                          MediaQuery.of(context).size.height * 0.03,
                      isThreeLine: true,
                      leading: Image.asset(
                        "assets/images/register.png",
                        fit: BoxFit.fill,
                      ),
                      title: AppText.headingThree(
                          vendingzonelist[index]!.vendingzonelocation),
                      subtitle: AppText.body("category : food \ntype : food"),
                      trailing: AppText.body(
                          "Maximum vendors allowed ${vendingzonelist[index]!.maximumVendorsallowed}"),
                      onTap: () {},
                    );
                  },
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => CircularProgressIndicator())),
    );
  }
}
