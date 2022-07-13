import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:second_exam/utils/colors.dart';
import 'package:second_exam/utils/icons.dart';
import 'package:second_exam/utils/styles.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSize {
  const MyCustomAppBar(
      {Key? key,
      required this.centerTitle,
      required this.title,
      required this.titleColor,
      required this.onTap})
      : super(key: key);
  final bool centerTitle;
  final String title;
  final Color titleColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: onTap,
        icon: SvgPicture.asset(
          MyIcons.thirdSvg3,
          color: Colors.yellowAccent,
          width: 20,
          height: 14,
        ),
      ),
      title: Text(
        title,
        style: MyTextStyle.interMedium500
            .copyWith(color: titleColor, fontSize: 16),
      ),
      centerTitle: centerTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: MyColors.white,
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 56);

  @override
  Widget get child => throw UnimplementedError();
}
