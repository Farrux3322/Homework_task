import 'package:flutter/material.dart';
import 'package:grid_view/utils/colors.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({Key? key, required this.title, required this.onTab}) : super(key: key);

  final String title;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: Ink(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.C_1317DD,
          borderRadius: BorderRadius.circular(34)
        ),
        child: InkWell(
          onTap: onTab,
          child: Center(child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: AppColors.white),)),
        ),
      ),
    );
  }
}
