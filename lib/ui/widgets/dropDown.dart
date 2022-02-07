import '../config/constants/colors.dart';
import 'package:flutter/material.dart';


class CustomdropDownButton extends StatelessWidget
{
  const CustomdropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.arrow_drop_down,),
      color: AppColors.primaryDark,
      iconSize: 12,
    );
  }
}