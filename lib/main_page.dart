import 'package:basari_kafasi/page_down.dart';
import 'package:basari_kafasi/page_up.dart';
import 'package:basari_kafasi/project_datas.dart';
import 'package:basari_kafasi/service.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with _StringUtility,ProjectDatas{
  final String urlUp = "assets/images/up.png";
  final String urlDown = "assets/images/down.png";
  final double notchMargin = 10;
  final EdgeInsets onePadding = const EdgeInsets.only(left: 16.0, bottom: 10, right: 16);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: ButtonName.values.length,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                _myShowDialog(context);
              },
              child: Text(gotIt)),
          appBar: _mainPageAppBar(),
          bottomNavigationBar: _mainPageBottomAppBar(),
          body: Padding(
            padding: onePadding,
            child: _mainPageTabBarView(),
          ),
        ));
  }

  TabBarView _mainPageTabBarView() {
    return TabBarView(
            children: [
              PageDown(
                  imageUrl: urlDown,
                  cardUrl: ProjectService.cardUrl,
                  cardCaption: ProjectService.cardCaptionDown.keys.toList(),
                  cardContent:
                      ProjectService.cardCaptionDown.values.toList()),
              PageUp(
                  imageUrl: urlUp,
                  cardUrl: ProjectService.cardUrl,
                  cardCaption: ProjectService.cardCaptionUp.keys.toList(),
                  cardContent: ProjectService.cardCaptionUp.values.toList()),
            ],
          );
  }

  BottomAppBar _mainPageBottomAppBar() {
    return BottomAppBar(
          notchMargin: notchMargin,
          shape: const CircularNotchedRectangle(),
          padding: EdgeInsets.zero,
          child: TabBar(tabs: [
            Tab(
              text: ButtonName.down.name,
            ),
            Tab(
              text: ButtonName.up.name,
            )
          ]),
        );
  }

  AppBar _mainPageAppBar() {
    return AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(personName),
        );
  }

  Future<dynamic> _myShowDialog(BuildContext context) {
    return showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(madeIt),
                  content: Text(ready),
                ),
              );
  }
}

enum ButtonName { down, up }

class _StringUtility{
  final String personName = "Furkan Yıldırım";
  final String madeIt = "You made it.";
  final String ready = "You are now ready for your goals.";
}
