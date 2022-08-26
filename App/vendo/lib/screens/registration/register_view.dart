import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:vendo/providers/vendor_detailsprovider.dart';
import 'package:vendo/routes.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppFonts/styles.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  GenderSelection? _gender = GenderSelection.male;
  String _location = '';
  String _name = '';
  String _dob = '';
  String _phoneNo = '';
  String _password = '';

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyClwDKfzGV_7ICoib-lk2rH0iw5IlKW5Lw"),
      ),
    );

    print(result.latLng);
    print(result.formattedAddress);
    setState(() {
      _location = result.formattedAddress.toString();
    });
  }

  void uploadVendorData() {
    String _genderType = '';
    switch (_gender) {
      case GenderSelection.male:
        _genderType = "male";
        break;
      case GenderSelection.female:
        _genderType = "female";
        break;
      case GenderSelection.other:
        _genderType = "other";
        break;
    }

    final vendordata = ref.read(vendordetailsProvider);
    vendordata.gender = _genderType;
    vendordata.dob = _dob;
    vendordata.address = _location;
    vendordata.name = _name;
    vendordata.phone = _phoneNo;
    vendordata.password = _password;
    //implement api here
    print("vendor data $_name , $_dob , $_genderType , $_location");
    log(vendordata.toJson().toString());
    print(
        "vendor data $_name , $_dob , $_genderType , $_location , $_phoneNo , $_password ");
  }

  late bool _validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: AppText.headingOne("Register"),
                ),
                verticalSpaceMedium,
                Row(
                  children: const [
                    Spacer(),
                    Image(
                      image: AssetImage("assets/images/register.png"),
                      height: 100,
                    ),
                  ],
                ),
                verticalSpaceMedium,
                SizedBox(
                  height: 50,
                  width: 300,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(20),
                          bottomEnd: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, bottom: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: AppText.headingTwo(
                          "Applicant Details",
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
                            keyboardType: TextInputType.name,
                            onChanged: ((value) {
                              _name = value;
                            }),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Applicant Name',
                              hintText: 'Enter Applicant Name',
                              errorText:
                                  _validate ? 'Value Can\'t Be Empty' : null,
                            ),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      DecoratedBox(
                        decoration: borderBoxOutline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            keyboardType: TextInputType.phone,
                            onChanged: ((value) {
                              _phoneNo = value;
                            }),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                errorText:
                                    _validate ? 'Value Can\'t Be Empty' : null,
                                labelText: 'Applicant Phone No',
                                hintText: 'Enter phone no'),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      // DecoratedBox(
                      //   decoration: borderBoxOutline,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20),
                      //     child: PasswordField(
                      //       onChanged: (value) {
                      //         _password = value;
                      //       },
                      //       passwordConstraint: r'.*[@$#.*].*',
                      //       inputDecoration: PasswordDecoration(inputStyle: null),
                      //       //hintText: 'Include special characters',
                      //       errorMessage:
                      //           'must contain special character either . * @ # \$',
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                        ),
                        child: PasswordField(
                          backgroundColor: Colors.grey[100],
                          onChanged: (value) {
                            _password = value;
                          },
                          //controller: _passwordController,
                          //color: ,
                          passwordConstraint: r'.*[@$#.*].*',
                          inputDecoration: PasswordDecoration(),
                          //hintText: 'must have special characters',
                          border: PasswordBorder(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.blueGrey),
                            ),
                          ),
                          errorMessage:
                              'must contain special character either . * @ # \$',
                        ),
                      ),
                      verticalSpaceMedium,
                      TextField(
                        controller: dateInput,
                        decoration: InputDecoration(
                            errorText:
                                _validate ? 'Value Can\'t Be Empty' : null,
                            icon: const Icon(Icons.calendar_today),
                            labelText: "Enter Birthday"),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateInput.text = formattedDate;
                            });
                            _dob = formattedDate;
                          } else {}
                        },
                      ),
                      verticalSpaceMedium,
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
                                errorText:
                                    _validate ? 'Value Can\'t Be Empty' : null,
                                border: InputBorder.none,
                                labelText: 'Location',
                                hintText: _location,
                                hintStyle: body1Style),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      AppText.bodyBold("Gender : "),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Radio<GenderSelection>(
                                  value: GenderSelection.male,
                                  groupValue: _gender,
                                  onChanged: (GenderSelection? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                AppText.body("male"),
                                const Spacer(),
                                Radio<GenderSelection>(
                                  value: GenderSelection.female,
                                  groupValue: _gender,
                                  onChanged: (GenderSelection? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                AppText.body("female"),
                                const Spacer(),
                                Radio<GenderSelection>(
                                  value: GenderSelection.other,
                                  groupValue: _gender,
                                  onChanged: (GenderSelection? value) {
                                    setState(() {
                                      _gender = value;
                                    });
                                  },
                                ),
                                AppText.body("other"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceMedium,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              _name.toString().isEmpty ? _validate = true : _validate = false;
              _phoneNo.toString().isEmpty
                  ? _validate = true
                  : _validate = false;
              _password.toString().isEmpty
                  ? _validate = true
                  : _validate = false;
              _location.toString().isEmpty
                  ? _validate = true
                  : _validate = false;
              _dob.toString().isEmpty ? _validate = true : _validate = false;
            });
            RegExp contact = RegExp(r'[1-9]{1}[0-9]{9}');
            if (_validate == false && contact.hasMatch(_phoneNo) == true) {
              uploadVendorData();
              Navigator.of(context).pushNamed(Routes.nationalityEvidence);
            } else if (contact.hasMatch(_phoneNo) == false) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const AlertDialog(
                        title: Text("Enter valid phone number"),
                      ));
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 60, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
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
        ),
      ),
    );
  }
}

enum GenderSelection {
  male,
  female,
  other,
}
