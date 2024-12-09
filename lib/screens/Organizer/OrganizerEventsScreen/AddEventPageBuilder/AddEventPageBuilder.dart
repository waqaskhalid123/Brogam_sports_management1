import 'package:brogam/screens/Organizer/OrganizerEventsScreen/EventSuccessScreen/event_success_screen.dart';
import 'package:brogam/widgets/CutomActionButton/ActionButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../../../providers/OraganizerProvider/EventPageBuilderProvider.dart';
import '../../../../services/constants/constants.dart';
import '../AboutScreen/about_screen.dart';
import '../EventTimeDateScreen/event_time_date_screen.dart';
import '../GalleryScreen/gallery_screen.dart';


class Addeventpagebuilder extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final pageViewProvider = Provider.of<EventPageBuilderProvider>(context);
   final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          "Add Event",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          EasyStepper(
            activeStep: pageViewProvider.currentIndex,
            unreachedStepTextColor: AppColors.lighyGreyColor1,
            activeStepBorderColor: AppColors.secondaryColor,
            activeStepBorderType: BorderType.normal,
            finishedStepBorderColor: AppColors.secondaryColor,
            finishedStepBackgroundColor: AppColors.secondaryColor,
            finishedStepIconColor: Colors.white,
            activeStepIconColor: AppColors.secondaryColor,
            unreachedStepBorderType: BorderType.normal,
            lineStyle: LineStyle(
              lineType: LineType.normal,
              lineThickness: 3,
              lineSpace: 1,
              lineWidth: 10,
              lineLength: 60,
              unreachedLineType: LineType.normal,
              unreachedLineColor: AppColors.lighyGreyColor1,
              finishedLineColor: AppColors.secondaryColor,
              activeLineColor: AppColors.lighyGreyColor1
            ),
            internalPadding: 10,
            stepBorderRadius: 15,
            borderThickness: 2,
            activeStepTextColor: AppColors.secondaryColor,
            finishedStepTextColor: AppColors.secondaryColor,
            showLoadingAnimation: false,
            activeStepBackgroundColor: AppColors.white,
            enableStepTapping: false,
            steppingEnabled: true,
            stepRadius: 20.0,
            showStepBorder: true,
            steps: List.generate(3, (index) {
              return
                EasyStep(
                icon: (index == pageViewProvider.currentIndex)
                    ? const Icon(Icons.circle, color: Colors.green)
                    : (index < pageViewProvider.currentIndex)
                    ? const Icon(Icons.check, color: Colors.green)
                    : const Icon(Icons.circle, color: Colors.grey),
                customTitle:Center(
                  child: Text(
                    index == 0
                        ? 'About'
                        : index == 1
                        ? 'Gallery'
                        : 'Time & Date',
                    style: TextStyle(
                      fontFamily: AppFontsFamily.poppins,
                      fontWeight: index == pageViewProvider.currentIndex
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ),

              );
            }),
            // onStepTapped: (index) {
            //   _pageController.animateToPage(
            //     index,
            //     duration: const Duration(milliseconds: 300),
            //     curve: Curves.easeInOut,
            //   );
            //   pageViewProvider.setCurrentIndex(index);
            // },
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                pageViewProvider.setCurrentIndex(index);
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return AboutScreen();
                } else if (index == 1) {
                  return GalleryScreen();
                } else {
                  return EventTimeDateScreen();
                }
              },
            ),
          ),
        ActionButton(
          text: pageViewProvider.currentIndex == 2 ? 'Finish' : 'Next',
          backgroundColor: AppColors.primaryColor,
          textColor: AppColors.white,
          borderColor: AppColors.primaryColor,
          onPressed: () {
            if (pageViewProvider.currentIndex < 2) {
              // Navigate to the next page
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              // Increment the current index
              pageViewProvider.setCurrentIndex(pageViewProvider.currentIndex + 1);
            } else if (pageViewProvider.currentIndex == 2) {
              // Navigate to EventSuccessScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventSuccessScreen(),
                ),
              );
            }
          },
          buttonWidth: screenWidth * 0.9,
          borderRadius: 25,
        ),
        const SizedBox(height: 20),
        ],
      ),
    );
  }
}



