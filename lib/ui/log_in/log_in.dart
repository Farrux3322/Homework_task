import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grid_view/ui/home_screen/home_screen.dart';
import 'package:grid_view/utils/colors.dart';
import 'package:grid_view/utils/images.dart';
import 'package:grid_view/widgets/global_button.dart';
import 'package:grid_view/widgets/universal_input.dart';
import 'package:grid_view/widgets/universal_input_password.dart';

import '../../local/models/profile_model.dart';
import '../../local/storage_repository.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  late ProfileModel profileModel;

  @override
  void initState() {
    profileModel = ProfileModel(
      newEmail: StorageRepository.getString("new_email"),
      newPassword: StorageRepository.getString("new_password"),
      confirmPassword: StorageRepository.getString("confirm_password"),
      firstName: StorageRepository.getString("first_name"),
      lastName: StorageRepository.getString("last_name"),
      email: StorageRepository.getString("email"),
      password: StorageRepository.getString("password"),
    );
    debugPrint("email: ${profileModel.email}");
    debugPrint("password: ${profileModel.password}");
    super.initState();
  }


  Future<void> saveInputText(String key, String value) async {
    await StorageRepository.putString(key, value);
  }



  bool check = false;

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
        padding: const EdgeInsets.only(left: 32, right: 38, bottom: 30),
        child: Column(
          children: [
            Expanded(child: ListView(
              children: [
                Image.asset(AppImages.logo2,height: 250,width: double.infinity,),
                SizedBox(height: 20/666*height,),
                UniversalInput(hintText: "Email", iconPath: AppImages.email, onChanged: (value){
                  profileModel = profileModel.copyWith(newEmail: value);

                }),
                SizedBox(height: 20/666*height,),
                UniversalInputPassword(hintText: "Password", iconPath: AppImages.password, onChanged: (value){
                  profileModel = profileModel.copyWith(newPassword: value);


                }),
                SizedBox(height: 10/666*height,),
                Row(
                  children: [
                    SizedBox(width: 25,),
                    Switch(value: check, onChanged: (v){
                      setState(() {
                        check=!check;
                      });
                    }),
                    Text("Remember Me",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF131212).withOpacity(0.8)),),
                    Spacer(),
                    Text("Forgot Password?",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF131212).withOpacity(0.8)),),
                    SizedBox(width: 25,),
                  ],
                ),
                SizedBox(height: 26/666*height,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GlobalButton(title: "LOGIN", onTab: (){
                    saveInputText("new_email", profileModel.newEmail);
                    saveInputText("new_password", profileModel.newPassword);
                    debugPrint("${profileModel.password} == ${profileModel.newPassword} ");
                    debugPrint("${profileModel.email} == ${profileModel.newEmail} ");

                    if(profileModel.password==profileModel.newPassword && profileModel.email==profileModel.newEmail){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return HomeScreen();
                      }));
                    }else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Ma'lumotlar xato"),
                        ),
                      );
                    }

                  }),
                ),
                SizedBox(height: 14/666*height,),
                Center(child: Text("OR",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF131212).withOpacity(.8)),),),
                SizedBox(height: 8/666*height,),
                Center(child: Text("Log in with",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w400,color: Color(0xFF131212).withOpacity(.8)),),),
                SizedBox(height: 20/666*height,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImages.google),
                      SvgPicture.asset(AppImages.apple),
                      SvgPicture.asset(AppImages.facebook),
                    ],
                  ),
                ),
                SizedBox(height: 20/666*height,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF131212).withOpacity(0.8)),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: const Text(
                        "Register now",
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
