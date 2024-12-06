import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/providers/NavigationProvider.dart';
import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';

import '../../../widgets/BottomNav/bottomnav.dart';
import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';
import '../EventScreen/EventScreen.dart';
import '../NotificationScreen/Notifications/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _screens = [
    const HomeScreen(),
    EventScreen(),
    BookingsScreen(),
    ProfileDetailsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Navigate to the selected screen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Consumer<HomeScreenProvider>(
          builder: (context, value, child) {
            return Stack(
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
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const  NotificationsScreen(),));
                                          },
                                          child: Icon(
                                            Icons.notifications,
                                            color: AppColors.primaryColor,
                                            size: AppFontSizes.title1,
                                          ),
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
                              hintText: "Search",
                              controller: _searchController,
                              keyboardType: TextInputType.text,
                              validator: (p0) {
                                return null;
                              },
                              suffixIcon: GestureDetector(
                                onTap: () {
                                },
                                child: const Icon(
                                  CupertinoIcons.slider_horizontal_3,
                                ),
                              ),
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),

                          // Categories
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 10),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                              height: screenHeight * 0.05,
                              child:  ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: GestureDetector(
                                      onTap: () {
                                        value.setSelectedIndex(index);
                                      },
                                      child: CustomRoundedContainer(
                                        showBorder: true,
                                        backgroundColor: index == value.selectedIndex
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
                                              color: index == value.selectedIndex
                                                  ? AppColors.white
                                                  : AppColors.black,
                                            ),
                                          ),
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
                    child: Bottomnav(
                      currentIndex: _currentIndex,
                      onItemSelected: _onItemTapped,
                    )
                ),
              ],
            );
          }
        ));
  }
}
