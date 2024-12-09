import 'package:brogam/providers/HomeScreenProvider.dart';
import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/CustomRoundedContainer/custom_rounded_container.dart';
import 'package:brogam/widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/widgets/HorizontalEventCard/horizontal_event_card.dart';
import 'package:brogam/widgets/OrganizerBottomNav/organizer_bottom_nav.dart';
import 'package:brogam/widgets/VerticalEventCard/vertical_event_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../widgets/Bell_IconHomeScreen/bell_icon.dart';
import '../OrganizerHomeScreen/organizer_home_screen.dart';
import 'AddEventPageBuilder/AddEventPageBuilder.dart';

class OrganizerEventScreen extends StatefulWidget {
  const OrganizerEventScreen({
    super.key,
  });

  @override
  State<OrganizerEventScreen> createState() => _OrganizerEventScreenState();
}

class _OrganizerEventScreenState extends State<OrganizerEventScreen> {
  int _currentIndex = 1;
  final TextEditingController _searchController = TextEditingController();

  final List<Widget> _screens = [
    const OrganizerHomeScreen(),
    OrganizerEventScreen(),
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
  List<String> category = ["Active Event", "Post Event"];
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
                                  SizedBox(height: screenHeight * 0.005),
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'My Events',
                                      style: TextStyle(
                                        fontFamily: AppFontsFamily.poppins,
                                        fontSize: AppFontSizes.title1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                               Padding(
                                 padding: const EdgeInsets.only(right: 20.0),
                                 child: Icon(Iconsax.calendar, color: AppColors.primaryColor),
                               )
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
                              itemCount: category.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      value.setSelectedIndex(index);
                                    },
                                    child: CustomRoundedContainer(
                                      borderColor: AppColors.containerBorderColor,
                                      showBorder: true,
                                      backgroundColor: index == value.selectedIndex
                                          ? AppColors.secondaryColor
                                          : AppColors.white,
                                      radius: 12,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      child: Center(
                                        child: Text(
                                          category[index],
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

                       const  Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                  padding:  EdgeInsets.fromLTRB(0, 10, 15, 10),
                                  child: Text(
                                    'Upcoming Events',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.subtitle,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                // Vertical Event Card
                                 VerticalEventCard(
                                  length: 2,
                                ),
                                Padding(
                                  padding:  EdgeInsets.fromLTRB(0, 10, 15, 10),
                                  child: Text(
                                    'Events on 25 Dec',
                                    style: TextStyle(
                                      fontFamily: AppFontsFamily.poppins,
                                      fontSize: AppFontSizes.subtitle,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
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

              // // Bottom Navigation Bar
              Positioned(
                bottom: 100.0,
                left: 0,
                right: 0,
                child:  Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addeventpagebuilder(),));
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 15,
                  right: 15,
                  bottom: 20, // Adjust height from bottom
                  child: OrganizerBottomNav(
                    currentIndex: _currentIndex,
                    onItemSelected: _onItemTapped,
                  )),
            ],
          );
        }));
  }
}
