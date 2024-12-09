import 'package:brogam/screens/Home/EventBookingScreens/ReviewTickerSummaryScreen/ReviewTickerSummaryScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomDropDown/custom_drop_down.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/DotedBorder/doted_border.dart';

class GalleryScreen extends StatefulWidget {
  GalleryScreen(
      {super.key,});

  @override
  State<GalleryScreen> createState() =>
      _AboutScreenState();
}

class _AboutScreenState
    extends State<GalleryScreen> {
  final TextEditingController dobController = TextEditingController(text: null);
  String? selectedLocation;

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
              'Upload Images',
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
            CustomPaint(
              size: Size(200, 200),
              painter: DottedBorderPainter(),
              child: Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/camera.png", height: 35, width: 35,),
                   const Text(
                      "Upload pictures",
                      style: TextStyle(fontSize: AppFontSizes.subtitle1, color: Colors.black, fontFamily: AppFontsFamily.poppins, fontWeight: FontWeight.bold),
                    ),
                   const Text(
                      "Allowed Formats : svg,jpeg,png",
                      style: TextStyle(fontSize: AppFontSizes.subtitle1, color: Colors.black, fontFamily: AppFontsFamily.poppins),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.020,
            ),
            Text(
              'Add Online Link',
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
              hintText: 'wwww.abc.link',
              hintTextColor: AppColors.IconColors,
              keyboardType: TextInputType.text,
              fillColor: AppColors.textFiledColor,
              prefixIcon: Icon(Icons.link, color: AppColors.black,),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your name';
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
