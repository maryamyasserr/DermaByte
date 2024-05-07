import 'package:dermabyte/Core/utils/font_styels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerActiveItem extends StatelessWidget {
  const DrawerActiveItem({super.key, required this.title, required this.icon, this.onTap});

  final String title, icon;
  final void Function()? onTap;
  
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title: Text(title,style: Styels.textStyle20_700(context).copyWith(color: Colors.white),),
    );
  }
}
