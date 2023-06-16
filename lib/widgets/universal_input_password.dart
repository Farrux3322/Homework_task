import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class UniversalInputPassword extends StatefulWidget {
  const UniversalInputPassword(
      {Key? key,
        required this.hintText,
        required this.iconPath,
        required this.onChanged})
      : super(key: key);

  final String hintText;
  final String iconPath;
  final ValueChanged<String> onChanged;
  @override
  State<UniversalInputPassword> createState() => _UniversalInputPasswordState();
}

class _UniversalInputPasswordState extends State<UniversalInputPassword> {

  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(-3, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: passwordVisible,
        onChanged: widget.onChanged,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle:const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          suffixIcon: IconButton(
            icon: Icon(passwordVisible
                ? Icons.visibility
                : Icons.visibility_off),
            onPressed: () {
              setState(
                    () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10,right: 10),
            child: SvgPicture.asset(widget.iconPath,width: 13,height: 15,),
          ),
          prefixIconColor: Color(0xFF1317DD),
          contentPadding: const EdgeInsets.all(13),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(width: 1, color: Color(0xFFCBD5E1))),
        ),
        cursorHeight: 18,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
