import 'package:flutter/material.dart';
import 'package:grid_view/local/storage_repository.dart';
import 'package:grid_view/ui/log_in/log_in.dart';
import 'package:grid_view/utils/colors.dart';
import 'package:grid_view/utils/images.dart';
import 'package:grid_view/widgets/universal_input.dart';
import 'package:grid_view/widgets/universal_input_password.dart';

import '../../local/models/profile_model.dart';
import '../../widgets/global_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late ProfileModel profileModel;

  @override
  void initState() {
    profileModel = ProfileModel(
      newPassword: StorageRepository.getString("new_password"),
      newEmail: StorageRepository.getString("new_email"),
      confirmPassword: StorageRepository.getString("confirm_password"),
      firstName: StorageRepository.getString("first_name"),
      lastName: StorageRepository.getString("last_name"),
      email: StorageRepository.getString("email"),
      password: StorageRepository.getString("password"),
    );
    super.initState();
  }

  Future<void> saveInputText(String key, String value) async {
    await StorageRepository.putString(key, value);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 186,
                  width: double.infinity,
                ),
                SizedBox(
                  height: height * 29 / 666,
                ),
                const Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                )),
                SizedBox(
                  height: 20 / 666 * height,
                ),
                UniversalInput(
                    hintText: "First Name",
                    iconPath: AppImages.profile,
                    onChanged: (value) {
                      profileModel = profileModel.copyWith(firstName: value);
                    }),
                SizedBox(
                  height: 10 / 666 * height,
                ),
                UniversalInput(
                    hintText: "Last Name",
                    iconPath: AppImages.profile,
                    onChanged: (value) {
                      profileModel = profileModel.copyWith(lastName: value);
                    }),
                SizedBox(
                  height: 10 / 666 * height,
                ),
                UniversalInput(
                    hintText: "Email",
                    iconPath: AppImages.email,
                    onChanged: (value) {
                      profileModel = profileModel.copyWith(email: value);
                    }),
                SizedBox(
                  height: 10 / 666 * height,
                ),
                UniversalInputPassword(
                    hintText: "Password",
                    iconPath: AppImages.password,
                    onChanged: (value) {
                      profileModel = profileModel.copyWith(password: value);
                    }),
                SizedBox(
                  height: 10 / 666 * height,
                ),
                UniversalInputPassword(
                    hintText: "Confirm Password",
                    iconPath: AppImages.password,
                    onChanged: (value) {
                      profileModel =
                          profileModel.copyWith(confirmPassword: value);
                    }),
                SizedBox(
                  height: 37 / 666 * height,
                ),
                GlobalButton(
                    title: "SIGN UP",
                    onTab: () {
                      if (profileModel.canSaveData() &&
                          profileModel.confirmPassword ==
                              profileModel.password) {
                        saveInputText("first_name", profileModel.firstName);
                        saveInputText("last_name", profileModel.lastName);
                        saveInputText("email", profileModel.email);
                        saveInputText("password", profileModel.password);
                        saveInputText(
                            "confirm_password", profileModel.confirmPassword);
                        debugPrint("first name: ${StorageRepository.getString("first_name")}");
                        debugPrint("last name: ${StorageRepository.getString("last_name")}");
                        debugPrint("email: ${StorageRepository.getString("email")}");
                        debugPrint("password: ${StorageRepository.getString("password")}");
                        debugPrint("confirm password: ${StorageRepository.getString("confirm_password")}");

                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return LoginScreen();
                        }));

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ma'lumotlar xato"),
                          ),
                        );
                      }
                    }),
                SizedBox(
                  height: 25 / 666 * height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF131212).withOpacity(0.8)),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1317DD),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
