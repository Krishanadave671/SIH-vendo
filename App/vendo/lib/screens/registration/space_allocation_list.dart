import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vendo/models/vendingzoneModel/vendingzone_details.dart';
import 'package:vendo/providers/vending_zoneprovider.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/colors.dart';
import '../../routes.dart';

// @immutable
// class VendingZones {
//   final String id;
//   final String streetName;
//   final String location;
//   final String description;
//   final String imageFile;
//   final int max;
//   final String city;
//   final String ward;
//   final int tax;

//   const VendingZones({
//     required this.id,
//     required this.streetName,
//     required this.location,
//     required this.description,
//     required this.imageFile,
//     required this.max,
//     required this.city,
//     required this.ward,
//     required this.tax,
//   });
// }

// class VendingZonesNotifier extends StateNotifier<List<VendingZones>> {
//   VendingZonesNotifier() : super([]);

//   void addZone(VendingZones vendingZones) {
//     state = [...state, vendingZones];
//   }

//   void removeZone(String id) {
//     state = [
//       for (final vendingZones in state)
//         if (vendingZones.id != id) vendingZones,
//     ];
//   }

//   void getZones() {
//     //add api implementation here
//     for (int i = 0; i < 12; i++) {
//       String id = '23';
//       String streetName = 'kanderpada';
//       String location = "34.23323.23";
//       String description = "this is a nice place to sell";
//       String imageFile = "assets/images/user.png";
//       int max = 34;
//       String city = "mumbai";
//       String ward = "R";
//       int tax = 3422;
//       final vd = VendingZones(
//         id: id,
//         streetName: streetName,
//         location: location,
//         description: description,
//         imageFile: imageFile,
//         max: max,
//         city: city,
//         ward: ward,
//         tax: tax,
//       );

//       addZone(vd);
//     }
//   }
// }

// final vendingZonesProvider =
//     StateNotifierProvider<VendingZonesNotifier, List<VendingZones>>((ref) {
//   return VendingZonesNotifier();
// });

class SpaceAllocationListView extends ConsumerStatefulWidget {
  const SpaceAllocationListView({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SpaceAllocationListViewState();
}

class _SpaceAllocationListViewState
    extends ConsumerState<SpaceAllocationListView> {
  @override
  Widget build(BuildContext context) {
    //get vendingzones that are less than max tax , in the same city , allowed to sell based on type and have slots available
    final vendingzonesdata = ref.watch(vendingzonedataProvider);
    log(vendingzonesdata.toString());

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
          left: 10,
          right: 10,
        ),
        child: vendingzonesdata.when(
          data: (data) {
            List<VendingzoneModel?> vendingzonelist =
                data.map((e) => e).toList();
            log(vendingzonelist.toList().toString());
            return RefreshIndicator(
              onRefresh: () async {
                ref.refresh(vendingzonedataProvider);
              },
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: vendingzonelist.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ListTile(
                        
                        isThreeLine: true,
                        leading: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              vendingzonelist[index]!.vendingZoneImageurl,
                              width: MediaQuery.of(context).size.width * 0.15,
                              fit: BoxFit.fitWidth,
                            ),
                          ],
                        ),
                        title: Expanded(
                            child: AppText.bodyBold(
                          vendingzonelist[index]!.vendingZoneLocality,
                          isSingleLined: 2,
                        )),
                        subtitle: Expanded(
                          child: Container(
                            height: 60,
                            child: AppText.body(
                              vendingzonelist[index]!.vendingZoneDescription,
                              isSingleLined: 1,
                            ),
                          ),
                        ),
                        trailing: AppText.body(
                            vendingzonelist[index]!.vendingZoneWard),
                        onTap: () {
                          
                          Navigator.of(context).pushNamed(
                            Routes.vendingZoneCard,
                            arguments: VendingZoneViewArguments(
                                model: vendingzonelist[index]!),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (e, t) {
            log(e.toString());
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

//  floatingActionButton: FloatingActionButton(onPressed: () async {
      //   try {
      //     final _api = ref.watch(apiserviceProvider);
      //     var response = await _api.registerUser(vendordata);
      //     if (response.statusCode == 200) {
      //       showSnackBar(context, "Successfully registered");
      //       log(response.data);
      //     }
      //   } on Exception catch (e) {
      //     log(e.toString());
      //   }
      // }),
