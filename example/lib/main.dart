import 'package:flutter/material.dart';
import 'package:transparent_image_button_ex/transparent_image_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transparent Image Button Ex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Transparent Image Button Ex'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TransparentImageButton.assets(
              "assets/images/egg.png",
              width: 200,
              onTapInside: () => print("You tapped the image."),
              onTapOutside: () => print("You tapped outside the image."),
            ),
          ],
        ),
      ),
    );
  }
}
