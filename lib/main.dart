import 'dart:io';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pspdfkit_demo/widgets/image_swiper.dart';
import 'package:pspdfkit_demo/widgets/responsive_button2.dart';
import 'package:pspdfkit_demo/widgets/responsive_button3.dart';
import 'package:pspdfkit_flutter/src/main.dart';

import 'colors.dart';
import 'widgets/app_large_text.dart';
import 'widgets/app_text.dart';
import 'widgets/responsive_button.dart';
import 'widgets/signuture_swiper.dart';

const String DOCUMENT_PATH1 = 'PDFs/release.pdf';
const String DOCUMENT_PATH2 = 'PDFs/adobe_release.pdf';
const String DOCUMENT_PATH3 = 'PDFs/shutter_release.pdf';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List images = [
    '2e2e2e.png',
    '2e2e2e.png',
    '2e2e2e.png',
  ];

  List text = [
    'Choise a supplier to generate a release document.',
    'This is how to import a model image.',
    'This is how to sign a model release.',
  ];

  List decor = [
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: 500.0,
            height: 300.0,
            decoration: const BoxDecoration(
              color: Colors.orange,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 500,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Image.asset(
                  'images/clipart.png',
                  width: 500,
                  height: double.maxFinite,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: AppText(text: 'Swipe to see steps.'),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            height: 400,
            width: double.maxFinite,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ImageSwiper();
              },
              itemCount: 3,
            ),
          ),
        ),
      ],
    ),
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: AppText(text: 'Swipe to see steps.'),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            height: 400,
            width: double.maxFinite,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return SignatureSwiper();
              },
              itemCount: 3,
            ),
          ),
        ),
      ],
    )
  ];

  void showDocument(BuildContext context) async {
    final bytes = await DefaultAssetBundle.of(context).load(DOCUMENT_PATH1);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$DOCUMENT_PATH1';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);

    await Pspdfkit.present(tempDocumentPath);

    // to save manually
    Pspdfkit.save();
    // Pspdfkit.present('PDFs/release.pdf');
  }

  void showDocumentAdobe(BuildContext context) async {
    final bytes = await DefaultAssetBundle.of(context).load(DOCUMENT_PATH2);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$DOCUMENT_PATH2';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);

    await Pspdfkit.present(tempDocumentPath);

    // to save manually
    Pspdfkit.save();
    // Pspdfkit.present('PDFs/release.pdf');
  }

  void showDocumentShutter(BuildContext context) async {
    final bytes = await DefaultAssetBundle.of(context).load(DOCUMENT_PATH3);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$DOCUMENT_PATH3';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);

    await Pspdfkit.present(tempDocumentPath);

    // to save manually
    Pspdfkit.save();
    // Pspdfkit.present('PDFs/release.pdf');
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MaterialApp(
        home: Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/" + images[index],
                  ),
                  fit: BoxFit.cover),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      AppLargeText(text: 'Model Release'),
                      AppText(text: 'Generator', size: 30),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 300,
                        child: AppText(
                          text: text[index],
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: 200,
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () => showDocument(context),
                                child: ResponsiveButton1()),
                            GestureDetector(
                                onTap: () => showDocumentAdobe(context),
                                child: ResponsiveButton2()),
                            const SizedBox(width: 10),
                            GestureDetector(
                                onTap: () => showDocumentShutter(context),
                                child: ResponsiveButton3()),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: 300,
                        child: decor[index],
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 3),
                        width: 8,
                        height: index == indexDots ? 25 : 8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == indexDots
                                ? AppColors.mainColor
                                : AppColors.mainColor.withOpacity(0.3)),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    ));
  }
}
