import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:vendo/util/AppFonts/app_text.dart';
import 'package:vendo/util/AppInterface/ui_helpers.dart';
import 'package:vendo/util/colors.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  GenderSelection? _gender = GenderSelection.male;

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

    // Handle the result in your way
    print(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.1,
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
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Applicant Name',
                                hintText: 'Enter Applicant Name'),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      DecoratedBox(
                        decoration: borderBoxOutline,
                        child: const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Address',
                                hintText: 'Enter Address'),
                          ),
                        ),
                      ),
                      verticalSpaceMedium,
                      TextField(
                        controller: dateInput,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
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
                          } else {}
                        },
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
    );
  }
}

enum GenderSelection {
  male,
  female,
  other,
}
