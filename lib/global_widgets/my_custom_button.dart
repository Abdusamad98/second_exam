import 'package:flutter/material.dart';
import 'package:second_exam/utils/colors.dart';
import 'package:second_exam/utils/styles.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60,vertical: 50),
      height: 48,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyColors.C_2FB209),
          foregroundColor: MaterialStateProperty.all(MyColors.white),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(
              vertical: 14,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        child: Text(
          text,
          style: MyTextStyle.interSemiBold600.copyWith(
            fontSize: 14,
            color: MyColors.white,
          ),
        ),
      ),
    );
  }
}
