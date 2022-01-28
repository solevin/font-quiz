import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTitleBar extends StatelessWidget implements PreferredSizeWidget {
  AppTitleBar({Key? key, this.action}) : super(key: key);

  final List<Widget>? action;
  @override
  final Size preferredSize = Size(double.infinity, 15.h);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(15.h),
      child: AppBar(
        title: Text(
          'Fonts Quiz',
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        actions: action,
      ),
    );
  }
}
