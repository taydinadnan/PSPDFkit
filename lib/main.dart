import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pspdfkit_flutter/src/main.dart';

const String DOCUMENT_PATH = 'PDFs/release.pdf';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void showDocument(BuildContext context) async {
    final bytes = await DefaultAssetBundle.of(context).load(DOCUMENT_PATH);
    final list = bytes.buffer.asUint8List();

    final tempDir = await Pspdfkit.getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$DOCUMENT_PATH';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);

    await Pspdfkit.present(tempDocumentPath);

    // // to save manually
    // await Pspdfkit.save();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MaterialApp(
      home: Scaffold(body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    'Tap to Open Document',
                    style:
                        themeData.textTheme.headline4?.copyWith(fontSize: 21.0),
                  ),
                  onPressed: () => showDocument(context),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
