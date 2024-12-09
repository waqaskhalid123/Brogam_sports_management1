import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/Bell_IconHomeScreen/bell_icon.dart';
import '../../../widgets/BottomNav/bottomnav.dart';

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
    const ExploreScreen(),
    const BookingsScreen(),
    const ProfileDetailsScreen(),
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
        body: Consumer<HomeScreenProvider>(builder: (context, value, child) {
      return Stack(
        children: [
          // Main body content, visible behind or above the bottom navigation
          Positioned.fill(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 36, 0, 0),
                child: Column(
                  children: [
                    SizedBox(
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
                          const BellIcon(),
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
                          onTap: () {},
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
                        padding: const EdgeInsets.fromLTRB(0, 2, 0, 2),
                        height: screenHeight * 0.05,
                        child: ListView.builder(
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
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                                  const Text(
                                    'Featured',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.subtitle,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  TextButton(
                                    onPressed: () {
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
                                                  const ExploreScreen()));
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
                            const VerticalEventCard(
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
              )),
        ],
      );
    }));
  }
}
