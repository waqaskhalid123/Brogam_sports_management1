import 'package:brogam/services/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorGrid extends StatelessWidget {
  const TutorGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    int crossAxisCount = screenWidth < 600 ? 2 : 4;

    return SizedBox(
      height: screenHeight * 0.42,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildDashboardCard(
            index: index,
            title: index == 0
                ? "Total Events"
                : index == 1
                    ? "Completed Events"
                    : index == 2
                        ? "Cancelled Events"
                        : "Total Participants",
            value: index == 0
                ? "30"
                : index == 1
                    ? "28"
                    : index == 2
                        ? "2"
                        : "2k",
            percentageChange: "1.3%",
            progressValue: 0.11, // Example progress value (11%)
          );
        },
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String value,
    required String percentageChange,
    required double progressValue,
    required int index,
  }) {
    return Card(
      color: index == 0 ? AppColors.secondaryColor : AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:  TextStyle(
                color : index != 0 ? AppColors.black  : AppColors.white,
                fontSize: AppFontSizes.small,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: AppFontSizes.title1,
                fontFamily: AppFontsFamily.poppins,
                fontWeight: FontWeight.bold,
                color: index != 0 ? AppColors.black  : AppColors.white,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    index == 0
                        ? CircleAvatar(
                            radius: 14,
                            backgroundColor: AppColors.white,
                            child: Icon(
                              CupertinoIcons.arrow_up_right,
                              color: AppColors.primaryColor,
                              size: 16,
                            ),
                          )
                        : index == 3
                            ? CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.fill,
                                child: Icon(
                                  CupertinoIcons.arrow_up_right,
                                  color: AppColors.primaryColor,
                                  size: 16,
                                ),
                              )
                            : CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.fill.withOpacity(1),
                                child: Icon(
                                  CupertinoIcons.arrow_down_left,
                                  color: AppColors.secondaryColor,
                                  size: 16,
                                ),
                              ),
                    const SizedBox(width: 8),
                    Text(
                      percentageChange,
                      style: TextStyle(
                        color: index != 0 ? AppColors.black : AppColors.white,
                        fontFamily: AppFontsFamily.poppins,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // Circular Progress Indicator
                index == 0 ? const  SizedBox() : SizedBox(
                  width: 40,
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [CircularProgressIndicator(
                        value:
                            progressValue, // Progress value between 0.0 and 1.0
                        strokeWidth: 4,
                        color: Colors.teal,
                        backgroundColor: Colors.grey.shade300,
                      ),
                      Text(
                        "${(progressValue * 100).toInt()}%", // Display percentage inside
                        style:  TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: index != 0 ? AppColors.black : AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
