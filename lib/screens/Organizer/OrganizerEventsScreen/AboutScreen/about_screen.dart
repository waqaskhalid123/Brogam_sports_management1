import 'package:brogam/screens/Home/EventBookingScreens/ReviewTickerSummaryScreen/ReviewTickerSummaryScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomDropDown/custom_drop_down.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/GenderField/gender_field.dart';
import 'package:brogam/widgets/PhoneNoField/phone_no_field.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen(
      {super.key,});

  @override
  State<AboutScreen> createState() =>
      _AboutScreenState();
}

class _AboutScreenState
    extends State<AboutScreen> {
  final TextEditingController dobController = TextEditingController(text: null);
  String? selectedLocation;
  String? selectedEvent;
  String? selectedEventType;
  String? sportsCategrory;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.020,
            ),
            //name
            Text(
              'Event Title',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            CustomField(
              controller: TextEditingController(),
              hintText: 'Enter Event Title',
              hintTextColor: AppColors.IconColors,
              keyboardType: TextInputType.text,
              fillColor: AppColors.textFiledColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              borderColor: AppColors.lighyGreyColor1,
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'About Event',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            CustomField(
              height: screenHeight * 0.15, // Increase the overall container height
              maxLine: 200, // Set max lines to allow multi-line text input
              controller: TextEditingController(),
              hintText: 'Write Event Description',
              hintTextColor: AppColors.IconColors,
              keyboardType: TextInputType.multiline,
              fillColor: AppColors.textFiledColor,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Event Description';
                }
                return null;
              },
              borderColor: AppColors.lighyGreyColor1,
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Location',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            CustomDropdownField(
              value: selectedEvent,
              hintText: "Location",
              items: ["Usa", "Canada", "Spain"],
              onChanged: (value) {
                setState(() {
                  selectedEvent = value;
                });
              },
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Event',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            CustomDropdownField(
              value: selectedEventType,
              hintText: "Select Type",
              items: ["Physical Event", "Online Event",],
              onChanged: (value) {
                setState(() {
                  selectedEventType = value;
                });
              },
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Sports Category',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),

            CustomDropdownField(
              value: sportsCategrory,
              hintText: "Select Category",
              items: ["Cricket", "Swimming", "Football"],
              onChanged: (value) {
                setState(() {
                  sportsCategrory = value;
                });
              },
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            //select Date of Birth
            Text(
              'Ticker Price (per person)',
              style: TextStyle(
                fontFamily: AppFontsFamily.poppins,
                fontSize: AppFontSizes.body,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            CustomField(
              controller: TextEditingController(),
              hintText: '00.00',
              hintTextColor: AppColors.IconColors,
              keyboardType: TextInputType.text,
              fillColor: AppColors.textFiledColor,
              prefixIcon: Icon(Icons.monetization_on_outlined, color: AppColors.black,),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your Event Description';
                }
                return null;
              },
              borderColor: AppColors.lighyGreyColor1,
            ),
            SizedBox(
              height: screenHeight * 0.030,
            ),
          ],
        ),
      ),
    );
  }
}
