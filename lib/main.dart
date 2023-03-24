import 'package:basari_kafasi/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title = "Success Head";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: const MainPage(),
      theme: ThemeData.dark(),
    );
  }
}
