import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_quiz/configs.dart';
import 'package:font_quiz/db/font.dart';
import 'package:font_quiz/db/font_dao.dart';
import 'package:font_quiz/ui/common/app_title_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _viewProvider = ChangeNotifierProvider((ref) => ViewNotifier());

class ViewNotifier with ChangeNotifier {
  String _text = longText;
  final FontDao _fontDao = FontDao();

  String get text => _text;
  Future<List<Font>> get fonts async => _fontDao.findAll();

  Future<void> pushFavorite(int fontId) async {
    final font = await _fontDao.findById(fontId);
    final paramMap = font.toMap();
    paramMap['is_favorite'] = font.isFavorite ? 0 : 1;
    final updatedFont = Font.fromMap(paramMap);
    await _fontDao.update(fontId, updatedFont);
    await _fontDao.findById(fontId);
    notifyListeners();
  }

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
    final viewState = ref.watch(_viewProvider);

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
        child: FutureBuilder(
          future: viewState.fonts,
          builder: (BuildContext context, AsyncSnapshot<List<Font>> snapshot) {
            if (snapshot.hasData) {
              final fonts = snapshot.data!;
              return ListView.builder(
                itemCount: fonts.length,
                itemBuilder: (BuildContext context, int index) {
                  final font = fonts[index];
                  final displayName = font.name;
                  final fontFamily =
                      GoogleFonts.getFont(displayName).fontFamily;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50,
                      child: FadeInAnimation(
                        child: listChild(
                          context,
                          ref,
                          font: font,
                          fontId: font.id,
                          fontFamily: fontFamily,
                          displayName: displayName,
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Text('Now Loading...');
            }
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

  Widget drawerMenuContentButton(
    String text, {
    Color? color,
    void Function()? onTap,
  }) {
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

  Widget listChild(
    BuildContext context,
    WidgetRef ref, {
    required Font font,
    required int fontId,
    String? fontFamily,
    String? displayName,
  }) {
    final viewState = ref.watch(_viewProvider);
    var isFavorite = false;

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
            TextButton(
              child: Icon(
                font.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: font.isFavorite ? Colors.red : Colors.black38,
              ),
              onPressed: () {
                viewState.pushFavorite(fontId);
                if (isFavorite != true) {
                  //ハートが押されたときにfavoriteにtrueを代入している
                  isFavorite = true;
                } else {
                  isFavorite = false;
                }
              },
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
