import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';


class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTitleBar(),
      body: AnimationLimiter(
      child: ListView.builder(
        itemCount: textStyleList.length,
        itemBuilder: (BuildContext context, int index) {
          final fontFamily = textStyleList[index].fontFamily;
          final displayName = fontFamilyToDisplayName[fontFamily];
          if (kDebugMode) {
            print('fontFamily: $fontFamily');
          }
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(
                child: listChild(fontFamily, displayName),
              ),
            ),
          );
        }
      ),
      ),
    );
  }

  Widget listChild(String? fontFamily, String? displayName) {
    return Card(
      margin: EdgeInsets.all(3.r),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        side: BorderSide(
          color: Colors.black,
          width: 1.r,
        ),
      ),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Text(
              '- $displayName -',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              )
            ),
            Text(
              longText,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: fontFamily,
                color: Colors.grey,
              ),
            ),
          ]
        ), 
      ),
    );
  }
}
