import 'package:basari_kafasi/project_datas.dart';
import 'package:basari_kafasi/widget/custom_card_continue_widget.dart';
import 'package:flutter/material.dart';

class CustomProductCard extends StatelessWidget with _ProjectUtility ,ProjectDatas{
  CustomProductCard(
      {Key? key,
      required this.imageUrl,
      required this.caption,
      required this.content})
      : super(key: key);
  final String imageUrl;
  final String caption;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _generalPadding,
      child: Container(
        height: generalCardSize,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: smallBorderRadius,
        ),
        child: Row(
          children: [
            ///imageContainer
            _imageContainerCard(),
            _informationCard(context)
          ],
        ),
      ),
    );
  }

  Container _informationCard(BuildContext context) {
    return Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: specialBorderRadius,
            ),
            width: 247.4,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: mediumTopPadding,
                    child: Text(
                      caption,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: smallTopPadding,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      content,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return CustomCardContinue(
                            imageUrl: imageUrl,
                            content: content,
                            caption: caption,
                          );
                        },
                      ));
                    },
                    child: Text(
                      _continue,
                      style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                              ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  Padding _imageContainerCard() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: normalBorderRadius,
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
              ),
              height: imageHeigth,
              width: imageWidth,
            ),
          );
  }
}

class _ProjectUtility {
  final EdgeInsets _generalPadding = const EdgeInsets.symmetric(vertical: 8.0);
  final double generalCardSize = 160;
  final BorderRadius smallBorderRadius = BorderRadius.circular(15);
  final BorderRadius normalBorderRadius = BorderRadius.circular(25);
  final BorderRadius specialBorderRadius = const BorderRadius.only(
      topRight: Radius.circular(15),
      bottomRight: Radius.circular(15));
  final String _continue = "continue.";
  final double imageHeigth = 150;
  final double imageWidth = 120;
}
