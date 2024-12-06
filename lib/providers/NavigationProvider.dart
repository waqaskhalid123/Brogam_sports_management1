import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/EventScreen/EventScreen.dart';
import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen(); // Your Home Screen
      case 1:
        return  EventScreen(); // Your Events Screen
      case 2:
        return BookingsScreen(); // Your Bookings Screen
      case 3:
        return const ProfileDetailsScreen(); // Your Profile Screen
      default:
        return const HomeScreen();
    }
  }
}
