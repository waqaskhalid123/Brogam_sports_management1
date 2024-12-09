import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:provider/provider.dart';
import '../../../../providers/ProfileProvider.dart';
import '../../../../widgets/BottomNav/bottomnav.dart';
import '../../../../widgets/LogoutButton/LogoutButton.dart';
import '../../BookingsScreen/BookingsScreen.dart';
import '../../HomeScreen/home_screen.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  bool isLocationEnabled = true;

  int _currentIndex = 3;

  final List<Widget> _screens = [
    const HomeScreen(),
    ExploreScreen(),
    BookingsScreen(),
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
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.screenBgColor,
      body: Stack(
        children: [
          // Main content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                              AssetImage("assets/images/card2.png"),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'John',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: AppFontSizes.subtitle1,
                                fontFamily: AppFontsFamily.poppins,
                              ),
                            ),
                            const Text(
                              'john1@gmail.com',
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: AppFontsFamily.poppins,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                profileProvider.EditProfileNaviagtion(context);
                              },
                              child: Text(
                                'Update my information',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.forward),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _buildCard(
                  children: [
                    _buildListTile(
                      title: 'Card Details',
                      icon: Iconsax.card_copy,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      title: 'Change Password',
                      icon: Iconsax.lock_copy,
                      onTap: () {
                        profileProvider.ChangePasswordNaviagtion(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildCard(
                  children: [
                    _buildListTile(
                      title: 'Notification Settings',
                      icon: Iconsax.notification_copy,
                      onTap: () {
                        profileProvider.NotificationSettingNaviagtion(context);
                      },
                    ),
                    _buildDivider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Iconsax.location_copy, color: Colors.black),
                              SizedBox(width: 16),
                              Text(
                                'Location',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          Transform.scale(
                            scale: 0.8,
                            child: CupertinoSwitch(
                              activeColor: AppColors.primaryColor,
                              value: isLocationEnabled,
                              onChanged: (value) {
                                setState(() {
                                  isLocationEnabled = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _buildCard(
                  children: [
                    _buildListTile(
                      title: 'Help & Support',
                      icon: Iconsax.message_question_copy,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      title: 'FAQs',
                      icon: Icons.question_mark_rounded,
                      onTap: () {},
                    ),
                    _buildDivider(),
                    _buildListTile(
                      title: 'Privacy Policy',
                      icon: Iconsax.shield_security,
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  child: LogoutButton(
                    text: 'Logout',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      fontFamily: AppFontsFamily.poppins,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom Navigation
          Positioned(
            left: 15,
            right: 15,
            bottom: 20,
            child: Bottomnav(
              currentIndex: _currentIndex,
              onItemSelected: _onItemTapped,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(
            fontSize: AppFontSizes.body, fontFamily: AppFontsFamily.poppins),
      ),
      trailing: const Icon(CupertinoIcons.forward, color: Colors.grey),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.withOpacity(0.3),
    );
  }
}
