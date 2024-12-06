
import 'package:flutter/material.dart';

import '../../../../services/constants/constants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int number=2;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Center(child: Text('Notifications',style: TextStyle(fontSize: 18,color: AppColors.black,fontFamily: AppFontsFamily.poppins),)),
            Spacer(),
            Container(
              margin: const EdgeInsets.all(8.0), // Adds margin around the widget
              padding: const EdgeInsets.all(8.0), // Adds padding inside the widget
              child: Container(
                height: 34,
                width: 53,
                decoration: const BoxDecoration(
                  color: AppColors.redContainer,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                child: Center( // Centers the text inside the container
                  child: Text(
                    '${number} NEW',
                    style: TextStyle(fontSize: 12,color: AppColors.white),
                  ),
                ),
              ),
            )

          ],
        ),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: "Today"),
            NotificationTile(
              icon: CircleAvatar(
                backgroundImage: AssetImage("assets/images/card2.png"),
                radius: 35,
              ),
              title: "Online Event is Live, Join Now.",
              subtitle: "",
              time: "1h",
              actionButtons: Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // Set the border radius
                          ),
                        ),
                        child:  Text("Copy URL",style: TextStyle(color: AppColors.primaryColor),),
                      ),
                    ),

                    const SizedBox(width: 8),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(

                        onPressed: () {},
                        style: ElevatedButton.styleFrom(

                          backgroundColor: AppColors.primaryColor, // Set the background color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // Set the border radius
                          ),
                        ),
                        child: Text(
                          "Join",
                          style: TextStyle(color: AppColors.white), // Set the text color
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            NotificationTile(
              icon: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[300],
                child: Image.asset("assets/images/SaleIcon.png"),

              ),
              title: "Discount Alert",
              subtitle: "Lorem Ipsum neque earum quo ea est porro asperiores reprehenderit sint.",
              time: "1h",
            ),
            const SectionHeader(title: "Yesterday"),
            NotificationTile(
              icon: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[300],
                child: Image.asset("assets/images/Done.png"),

              ),
              title: "Booking successful",
              subtitle: "Lorem Ipsum neque earum quo ea est porro asperiores reprehenderit sint.",
              time: "1h",
            ),
            NotificationTile(
              icon: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child:Image.asset("assets/images/SaleIcon.png"),
                radius: 35,
              ),
              title: "Discount Alert",
              subtitle: "Lorem Ipsum neque earum quo ea est porro asperiores reprehenderit sint.",
              time: "1h",
            ),
            NotificationTile(
              icon: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Image.asset("assets/images/Wallet.png"),
                radius:35,
              ),
              title: "New Account Added",
              subtitle: "Lorem Ipsum neque earum quo ea est porro asperiores reprehenderit sint.",
              time: "1h",
            ),
          ],
        ),
      ),

    );
  }
}
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (title == "Today")
            TextButton(
              onPressed: () {},
              child:  Text(
                "Mark all as read",
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;
  final String time;
  final Widget? actionButtons;

  const NotificationTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    this.actionButtons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon,
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                if (subtitle.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ),
                if (actionButtons != null) ...[
                  const SizedBox(height: 8),
                  actionButtons!,
                ],
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }
}