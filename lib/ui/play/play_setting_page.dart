import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_quiz/ui/common/sound_view.dart';
import 'package:font_quiz/ui/play/play_setting_view.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemList = setItems();
    final tmpNums = itemList[0];
    final tmpDifficulty = itemList[1];
    var tmpDiff = 1;
    const textColor = Color(0xFF5C4444);
    const backColor = Color(0xFFFFFBE5);
    return Scaffold(
      appBar: AppBar(
        title: const Text('SETTING'),
      ),
      body: Consumer<SettingViewModel>(
        builder: (context, model, _) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 280.w,
                height: 35.h,
                child: SwitchListTile(
                  title: Text(
                    'エンドレスモード',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  value: model.endless,
                  onChanged: (bool value) {
                    context.read<SoundViewModel>().sound('switch');
                    model
                      ..endless = value
                      ..notify();
                  },
                ),
              ),
              SizedBox(
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
                  value: model.reverse,
                  onChanged: (bool value) {
                    context.read<SoundViewModel>().sound('switch');
                    model
                      ..reverse = value
                      ..notify();
                  },
                ),
              ),
              questionNum(model, tmpNums),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 100.w,
                        height: 35.h,
                        child: DropdownButton(
                          items: tmpDifficulty,
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
                      decoration: const BoxDecoration(color: Colors.orange),
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
                    onTap: () async {
                      switch (tmpDiff) {
                        case 0:
                          model.difficulty = 'Easy';
                          break;
                        case 1:
                          model.difficulty = 'Normal';
                          break;
                        case 2:
                          model.difficulty = 'Hard';
                          break;
                        default:
                          break;
                      }
                      if (model.reverse == true) {
                        await model.start();
                        // ignore: use_build_context_synchronously
                        context.go('/reverse');
                      } else {
                        await model.start();
                        // ignore: use_build_context_synchronously
                        context.go('/play');
                      }
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<List<DropdownMenuItem<int>>> setItems() {
  final tmpNums = <DropdownMenuItem<int>>[];
  final tmpDifficulty = <DropdownMenuItem<int>>[];

  tmpNums
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
  tmpDifficulty
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
  return [tmpNums, tmpDifficulty];
}

Widget questionNum(
  SettingViewModel model,
  List<DropdownMenuItem<int>> tmpNums,
) {
  const textColor = Color(0xFF5C4444);
  const backColor = Color(0xFFFFFBE5);
  if (model.endless) {
    return Padding(
      padding: EdgeInsets.all(8.h),
      child: SizedBox(
        height: 35.h,
      ),
    );
  } else {
    return Padding(
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
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 100.w,
              height: 35.h,
              child: DropdownButton(
                items: tmpNums,
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
          ),
        ],
      ),
    );
  }
}
