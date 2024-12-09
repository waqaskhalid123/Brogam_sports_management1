import 'package:brogam/providers/SignUpScreenProvider.dart';
import 'package:brogam/screens/Authentication/LoginScreen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../../services/constants/constants.dart';
import '../../../widgets/CustomToggle/custom_toggle.dart';
import '../../../widgets/CutomActionButton/ActionButton.dart';
import '../../../widgets/CutomTextField/custom_textField.dart';
import '../../../widgets/PhoneNoField/phone_no_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: screenHeight * 0.15,
                  ),
                  SizedBox(height: screenHeight * 0.03),
        
                  CustomToggle(
                    initialSelectedIndex: 0,
                    labels: const ['Public User', 'Organizer'],
                    onTap: (int selectedIndex) {
                      print("Selected index: $selectedIndex");
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: const  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create an Account',
                        style: TextStyle(
                          fontFamily: AppFontsFamily.poppins,
                          fontSize: AppFontSizes.title1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Full Name is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.person),
                    controller: _fullNameController,
                    hintText: 'Full Name',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.email),
                    controller: _emailController,
                    hintText: 'Email Address',
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  PhoneNumberField(),
                  SizedBox(height: screenHeight * 0.015),
                  CustomField(
                    obscureText: !context.watch<SignUpScreenProvider>().isPasswordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                    prefixIcon: const Icon(Icons.lock),
                    controller: _passwordController,
                    hintText: 'Password',
                    keyboardType: TextInputType.text,
                    suffixIcon: Consumer<SignUpScreenProvider>(
                      builder: (context, provider, child) {
                        return IconButton(
                          icon: Icon(
                            provider.isPasswordVisible
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                          ),
                          onPressed: provider.togglePasswordVisibility,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  ActionButton(
                    backgroundColor: AppColors.primaryColor,
                    onPressed: () {},
                    borderColor: AppColors.primaryColor,
                    text: "Create Account",
                    textColor: AppColors.white,
                    borderRadius: 25,
                    buttonWidth: double.infinity,
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  const Row(
                    children: [
                      Expanded(child: Divider(thickness: 1,)),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider(thickness: 1,)),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.020),
                  InkWell(
                    onTap: (){},
                    child: Container(
                      height: screenHeight * 0.06,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center items horizontally
                        crossAxisAlignment: CrossAxisAlignment.center, // Center items vertically
                        children: [
                          Image.asset(Assets.imagesGoogle, height: screenHeight * 0.03),
                          const SizedBox(width: 8), // Add some space between image and text
                          Text("Continue with Google", style: TextStyle(fontFamily: AppFontsFamily.poppins, color: AppColors.primaryColor, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(fontFamily: AppFontsFamily.poppins),
                        ),
                        TextButton(
                          onPressed: () {
                         Navigator.push(context,MaterialPageRoute(builder: (context) => const LoginScreen(),));
                          },
                          child: Text(
                            'Login in Now',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: AppFontsFamily.poppins),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
