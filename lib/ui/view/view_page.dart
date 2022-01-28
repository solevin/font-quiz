import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _viewProvider = ChangeNotifierProvider((ref) => ViewNotifier());

class ViewNotifier with ChangeNotifier {
  String _text = longText;

  String get text => _text;

  void change(String text) {
    _text = text;
    notifyListeners();
  }
}

class ViewPage extends HookConsumerWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppTitleBar(
        action: <Widget>[
          drawerMenuButton(scaffoldKey),
        ],
      ),
      endDrawer: Drawer(
        child: drawerMenuContent(context, ref),
      ),
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
                  child: listChild(context, ref,
                      fontFamily: fontFamily, displayName: displayName),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget drawerMenuButton(GlobalKey<ScaffoldState> scaffoldKey) {
    return InkWell(
      onTap: () => scaffoldKey.currentState?.openEndDrawer(),
      child: Icon(
        const IconData(0xf1ad, fontFamily: 'MaterialIcons'),
        size: 15.sp,
      ),
    );
  }

  Widget drawerMenuContent(BuildContext context, WidgetRef ref) {
    final textEditingController = TextEditingController();
    final viewState = ref.watch(_viewProvider);

    return Column(
      children: [
        DrawerHeader(
          child: Center(
            child: Text(
              'Editer & Filter',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.sp),
          child: Column(
            children: [
              Text(
                'Edit Text',
                style: TextStyle(fontSize: 15.sp, height: 3.sp),
              ),
              TextField(
                style: TextStyle(fontSize: 15.sp),
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(10.sp),
                ),
                controller: textEditingController,
              ),
              SizedBox(height: 300.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  drawerMenuContentButton(
                    'OK',
                    color: Colors.green[50],
                    onTap: () {
                      viewState.change(textEditingController.text);
                      Navigator.pop(context);
                    },
                  ),
                  drawerMenuContentButton(
                    'Cancel',
                    color: Colors.red[50],
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget drawerMenuContentButton(String text,
      {Color? color, void Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.sp,
        height: 30.sp,
        padding: EdgeInsets.all(5.r),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15.sp,
            ),
          ),
        ),
      ),
    );
  }

  Widget listChild(BuildContext context, WidgetRef ref,
      {String? fontFamily, String? displayName}) {
    final viewState = ref.watch(_viewProvider);

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
              ),
            ),
            Text(
              viewState.text,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: fontFamily,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
