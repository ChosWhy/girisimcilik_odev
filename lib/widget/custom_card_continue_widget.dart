import 'package:basari_kafasi/project_datas.dart';
import 'package:flutter/material.dart';

class CustomCardContinue extends StatelessWidget with ProjectDatas{
  CustomCardContinue(
      {Key? key,
      required this.imageUrl,
      required this.caption,
      required this.content})
      : super(key: key);
  final String imageUrl;
  final String caption;
  final String content;

  final double _imageSize = 200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatActionButtonContinue(context),
      body: SafeArea(
        child: Padding(
          padding: generalPadding,
          child: ListView(
            children: [
              //Image Container
              _imageContainerContinue(),
              //Caption
              _captionContinue(context),
              //content
              _contentContinue(context),
            ],
          ),
        ),
      ),
    );
  }

  Padding _contentContinue(BuildContext context) {
    return Padding(
              padding: mediumTopPadding,
              child: Text(
                content,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
  }

  Padding _captionContinue(BuildContext context) {
    return Padding(
              padding: largeTopPadding,
              child: Center(
                  child: Text(
                caption,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: const Color(0xff2af598),
                    ),
              )),
            );
  }

  Container _imageContainerContinue() {
    return Container(
              height: _imageSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
            );
  }

  FloatingActionButton _floatActionButtonContinue(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: const Color(0xff2af598),
        child: Text(gotIt));
  }
}
