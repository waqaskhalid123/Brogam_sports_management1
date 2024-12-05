import 'package:brogam/services/constants/constants.dart';
import 'package:brogam/widgets/Calender/calender.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../providers/LocationProvider.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../../../widgets/HorizontalMapCard/horizontal_map_card.dart';
import '../EventBookingScreens/EventDetailScreen/event_detail_screen.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  double _minPrice = 20;
  double _maxPrice = 120;
  // List<String> selectedCategories = [];
  List<String> items = [
    "Football",
    "Swimming",
    "Aerobics",
    "Soccer",
    "Martial Arts"
  ];
  bool isDropdownOpen = false;
  List<String> selectedItems = [];

  DateTime selectedDate = DateTime(2024, 10, 2);
  late GoogleMapController _mapController;
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();

    // Get the user's current location and move to it
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final locationProvider =
          Provider.of<LocationProvider>(context, listen: false);
      locationProvider.getCurrentLocation(context).then((_) {
        _moveToCurrentLocation(locationProvider);
      });
    });
  }

  void _moveToCurrentLocation(LocationProvider locationProvider) {
    if (locationProvider.currentLocation != null) {
      _mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              locationProvider.currentLocation!.latitude!,
              locationProvider.currentLocation!.longitude!,
            ),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 10.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            markers: locationProvider.currentLocationMarker != null
                ? {locationProvider.currentLocationMarker!}
                : {},
          ),
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // FloatingActionButton
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the value as needed
                      ),
                      onPressed: () {
                        locationProvider.getCurrentLocation(context).then((_) {
                          _moveToCurrentLocation(locationProvider);
                        });
                      },
                      child: Icon(Icons.my_location),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: screenHeight * 0.32,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10, // Number of items in the horizontal list
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventDetailScreen()));
                          },
                          child: const HorizontalMapCard());
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: CustomField(
              hintText: "Search",
              controller: _searchController,
              keyboardType: TextInputType.text,
              validator: (p0) {},
              suffixIcon: GestureDetector(
                onTap: () {
                  _openFilterDrawer(context);
                },
                child: Icon(
                  CupertinoIcons.slider_horizontal_3,
                ),
              ),
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _openFilterDrawer(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height * 0.9,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category Dropdown
                Text(
                  'Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isDropdownOpen = !isDropdownOpen;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Wrap(
                            spacing: 8.0,
                            runSpacing: 4.0,
                            children: [
                              if (selectedItems.isEmpty)
                                Text(
                                  'Select Items',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              else
                                ...selectedItems.map((item) => Chip(
                                      label: Text(item),
                                      deleteIcon: Icon(Icons.close, size: 16),
                                      onDeleted: () {
                                        setState(() {
                                          selectedItems.remove(item);
                                        });
                                      },
                                    )),
                            ],
                          ),
                        ),
                      ),
                      if (isDropdownOpen)
                        Container(
                          margin: EdgeInsets.only(top: 8.0),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: items.map((item) {
                              final isSelected = selectedItems.contains(item);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      selectedItems.remove(item);
                                    } else {
                                      selectedItems.add(item);
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Checkbox(
                                      value: isSelected,
                                      onChanged: (_) {
                                        setState(() {
                                          if (isSelected) {
                                            selectedItems.remove(item);
                                          } else {
                                            selectedItems.add(item);
                                          }
                                        });
                                      },
                                    ),
                                    Text(item),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Location
                Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green[700]),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'New York, USA',
                          style: TextStyle(
                              fontFamily: AppFontsFamily.poppins,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Price Range Slider

                SizedBox(height: 20),

                // Event Date
                Text('Event Date',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),

                SizedBox(
                  height: screenHeight * 0.1,
                  child: Calendar(),
                ),
                Spacer(),

                ActionButton(
                  text: 'Apply',
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {},
                  borderRadius: 20,
                  fontweight: FontWeight.bold,
                ),
                SizedBox(height: 10),
                ActionButton(
                  text: 'Reset',
                  backgroundColor: AppColors.white,
                  textColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {},
                  borderRadius: 20,
                  fontweight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
