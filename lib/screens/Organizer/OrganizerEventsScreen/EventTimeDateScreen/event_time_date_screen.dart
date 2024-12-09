import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../services/constants/constants.dart';
import '../../../../widgets/CutomTextField/custom_textField.dart';
import 'package:brogam/providers/OraganizerProvider/EventTimeDateProvider.dart';

class EventTimeDateScreen extends StatelessWidget {
  const EventTimeDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Consumer<EventTimeDateProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                // Name
                Text(
                  'Select Date',
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
                  onTap: () async {
                    _showCalendarModal(context, provider);
                  },
                  controller: TextEditingController(
                    text: provider.selectedDate != null
                        ? DateFormat('yyyy-MM-dd').format(provider.selectedDate!)
                        : '',
                  ),
                  hintText: "Select Date",
                  keyboardType: TextInputType.none,
                  suffixIcon: const Icon(Iconsax.calendar_1_copy, color: Colors.black),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Date is required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.020,
                ),
                Text(
                  'Select Start and End Time',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: CustomField(
                        onTap: () async {
                          _selectTime(context, provider, 'start');
                        },
                        controller: TextEditingController(
                          text: provider.startTime?.format(context) ?? '',
                        ),
                        hintText: "Start Time",
                        keyboardType: TextInputType.none,
                        suffixIcon: const Icon(Iconsax.clock_copy, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Start time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.42,
                      child: CustomField(
                        onTap: () async {
                          _selectTime(context, provider, 'end');
                        },
                        controller: TextEditingController(
                          text: provider.endTime?.format(context) ?? '',
                        ),
                        hintText: "End Time",
                        keyboardType: TextInputType.none,
                        suffixIcon: const Icon(Iconsax.clock_copy, color: Colors.black),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "End time is required";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.030,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCalendarModal(BuildContext context, EventTimeDateProvider provider) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header with title and close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Calendar with border
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.containerBorderColor, // Border color
                      width: 1, // Border width
                    ),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1), // Shadow color
                        blurRadius: 6, // How blurred the shadow is
                        offset: const Offset(0, 3), // Offset of the shadow
                      ),
                    ], // Rounded corners
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2000, 1, 1),
                    lastDay: DateTime.utc(2100, 12, 31),
                    focusedDay: provider.selectedDate ?? DateTime.now(),
                    selectedDayPredicate: (day) {
                      return isSameDay(provider.selectedDate, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      provider.setDate(selectedDay);
                      Navigator.pop(context);
                    },
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ActionButton(
                  text: "Done",
                  backgroundColor: AppColors.primaryColor,
                  textColor: AppColors.white,
                  borderColor: AppColors.primaryColor,
                  onPressed: () {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Selected Date: ${provider.selectedDate?.toLocal().toIso8601String().substring(0, 10)}",
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // Selecting time and updating provider
  Future<void> _selectTime(BuildContext context, EventTimeDateProvider provider, String type) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: type == 'start' ? provider.startTime ?? TimeOfDay.now() : provider.endTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (type == 'start') {
        provider.setStartTime(picked);
      } else {
        provider.setEndTime(picked);
      }
    }
  }

}
