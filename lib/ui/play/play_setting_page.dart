import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemList = setItems();
    final _nums = itemList[0];
    final _difficulty = itemList[1];
    var tmpDiff = 1;
    const textColor = Color(0xFF5C4444);
    const backColor = Color(0xFFFFFBE5);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTING'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SettingViewModel>(
            builder: (context, model, _) {
              return SizedBox(
                width: 280.w,
                height: 35.h,
                child: SwitchListTile(
                  title: Text(
                    'フォントモード',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  value: model.mode,
                  onChanged: (bool value) {
                    model
                      ..mode = value
                      ..notify();
                  },
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '問題数 : ',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
                Consumer<SettingViewModel>(
                  builder: (context, model, _) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 100.w,
                        height: 35.h,
                        child: DropdownButton(
                          items: _nums,
                          value: model.questionNum,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                          dropdownColor: backColor,
                          onChanged: (value) => {
                            model.questionNum = value! as int,
                            model.notify(),
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '難易度 : ',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
                Consumer<SettingViewModel>(
                  builder: (context, model, _) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 100.w,
                        height: 35.h,
                        child: DropdownButton(
                          items: _difficulty,
                          value: tmpDiff,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: textColor,
                          ),
                          dropdownColor: backColor,
                          onChanged: (value) => {
                            tmpDiff = value! as int,
                            model.notify(),
                          },
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: SizedBox(
              height: 40.h,
              width: 100.w,
              child: GestureDetector(
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Center(
                    child: Text(
                      'OK',
                      style: TextStyle(
                        fontSize: 30.sp,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  switch (tmpDiff) {
                    case 0:
                      context.read<SettingViewModel>().difficulty = 'Easy';
                      break;

                    case 1:
                      context.read<SettingViewModel>().difficulty = 'Normal';
                      break;

                    case 2:
                      context.read<SettingViewModel>().difficulty = 'Hard';
                      break;

                    default:
                      break;
                  }
                  if (context.read<SettingViewModel>().mode == true) {
                    // Navigator.of(context).pushNamed(
                    //   '/reverse',
                    // );
                    context.go('/reverse');
                  } else {
                    // Navigator.of(context).pushNamed(
                    //   '/play',
                    // );
                    context.go('/play');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<List<DropdownMenuItem<int>>> setItems() {
  final _nums = <DropdownMenuItem<int>>[];
  final _difficulty = <DropdownMenuItem<int>>[];

  _nums
    ..add(
      DropdownMenuItem(
        value: 5,
        child: Text(
          '5',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    )
    ..add(
      DropdownMenuItem(
        value: 10,
        child: Text(
          '10',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    )
    ..add(
      DropdownMenuItem(
        value: 15,
        child: Text(
          '15',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    )
    ..add(
      DropdownMenuItem(
        value: 20,
        child: Text(
          '20',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  _difficulty
    ..add(
      DropdownMenuItem(
        value: 0,
        child: Text(
          'Easy',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    )
    ..add(
      DropdownMenuItem(
        value: 1,
        child: Text(
          'Normal',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    )
    ..add(
      DropdownMenuItem(
        value: 2,
        child: Text(
          'Hard',
          style: TextStyle(fontSize: 20.sp),
        ),
      ),
    );
  return [_nums, _difficulty];
}
