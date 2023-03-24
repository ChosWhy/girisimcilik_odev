import 'package:basari_kafasi/widget/custom_product_card.dart';
import 'package:flutter/material.dart';

class PageUp extends StatelessWidget {
  const PageUp({
    super.key,
    required this.imageUrl, required this.cardUrl, required this.cardCaption, required this.cardContent,
  });
  final List<String> cardUrl;
  final List<String> cardCaption;
  final List<String> cardContent;
  final String imageUrl;
  final double imageSize = 270;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              SizedBox(
                height: imageSize,
                child: Image.asset(imageUrl),
              ),
              CustomProductCard(imageUrl: cardUrl[5], caption: cardCaption[0], content: cardContent[0]),
              CustomProductCard(imageUrl: cardUrl[6], caption: cardCaption[1], content: cardContent[1]),
              CustomProductCard(imageUrl: cardUrl[7], caption: cardCaption[2], content: cardContent[2]),
              CustomProductCard(imageUrl: cardUrl[8], caption: cardCaption[3], content: cardContent[3]),
              CustomProductCard(imageUrl: cardUrl[9], caption: cardCaption[4], content: cardContent[4]),
              CustomProductCard(imageUrl: cardUrl[10], caption: cardCaption[5], content: cardContent[5]),
            ],
          ),
        ));
  }
}