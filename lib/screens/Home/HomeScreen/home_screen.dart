import 'package:brogam/providers/NavigationProvider.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import '../EventScreen/EventScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        // Main body content, visible behind or above the bottom navigation
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
              child: Column(
                children: [
                  Container(
                    height: screenHeight * 0.075,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontFamily: AppFontsFamily.poppins,
                                  fontSize: AppFontSizes.small,
                                  color: AppColors.IconColors),
                            ),
                            SizedBox(height: screenHeight * 0.005),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: AppColors.black,
                                  size: AppFontSizes.body,
                                ),
                                SizedBox(width: screenWidth * 0.010),
                                const Text(
                                  'New York, USA',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: AppFontSizes.body,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.010),
                                Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.black,
                                  size: AppFontSizes.title1,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 30),
                          child: Stack(
                            children: [
                              CustomRoundedContainer(
                                padding: EdgeInsets.all(8),
                                showBorder: true,
                                borderColor: AppColors.primaryColor,
                                radius: 100,
                                child: Icon(
                                  Icons.notifications,
                                  color: AppColors.primaryColor,
                                  size: AppFontSizes.title1,
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.small,
                                      color: AppColors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Field
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: CustomField(
                      controller: TextEditingController(),
                      hintText: 'Search Sports Events',
                      hintTextColor: AppColors.IconColors,
                      keyboardType: TextInputType.text,
                      fillColor: AppColors.textFiledColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      borderRadius: BorderRadius.circular(25),
                      borderColor: AppColors.lighyGreyColor1,
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColors.primaryColor,
                      ),
                      suffixIcon: Icon(
                        Icons.filter_list,
                        color: AppColors.primaryColor,
                      ),
                      height: screenHeight * 0.06,
                    ),
                  ),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                      height: screenHeight * 0.05,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: CustomRoundedContainer(
                              showBorder: true,
                              backgroundColor: index == 0
                                  ? AppColors.secondaryColor
                                  : AppColors.white,
                              radius: 12,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  'Swimming',
                                  style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.body,
                                      color: index == 0
                                          ? AppColors.white
                                          : AppColors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Events Header: Featured
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                            child: Row(
                              children: [
                                Text(
                                  'Featured',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: AppFontSizes.subtitle,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EventDetailScreen(),
                                        ));
                                  },
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Horizontal Event Card
                          const HorizontalEventCard(),

                          // Events Header: Upcoming Events
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
                            child: Row(
                              children: [
                                const Text(
                                  'Upcoming Events',
                                  style: TextStyle(
                                    fontFamily: AppFontsFamily.poppins,
                                    fontSize: AppFontSizes.subtitle,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EventScreen()));
                                  },
                                  child: Text(
                                    'View all',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.body,
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Vertical Event Card
                          VerticalEventCard(
                            length: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Bottom Navigation Bar
        Positioned(
          left: 15,
          right: 15,
          bottom: 20, // Adjust height from bottom
          child: Container(
            height: 70, // Adjust height as needed
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(45)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: Offset(0, -3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.home_2,
                        color: AppColors.primaryColor,
                        size: AppFontSizes.title1,
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.small,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                // Events Container
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.map_1_copy,
                        color: AppColors.bottomIcon,
                        size: AppFontSizes.title1,
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.small,
                          color: AppColors.bottomIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                // Bookings Container
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.note_1_copy,
                        color: AppColors.bottomIcon,
                      ),
                      Text(
                        'Bookings',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.small,
                          color: AppColors.bottomIcon,
                        ),
                      ),
                    ],
                  ),
                ),
                // Profile Container
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.user_copy,
                        color: AppColors.bottomIcon,
                        size: AppFontSizes.title1,
                      ),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.small,
                          color: AppColors.bottomIcon,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
