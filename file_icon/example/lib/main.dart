import 'package:flutter/material.dart';
import 'package:file_icon/file_icon.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

const title = 'File icon for Flutter';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _input = 'main.dart';
  double _size = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          InkWell(
            child: FileIcon('.html', size: 32),
            onTap: () {
              launchUrl(Uri.parse('https://github.com/pd4d10/file-icon'));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (v) {
                _input = v;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'File name',
                labelText: 'Input file name here',
              ),
            ),
            Slider(
              value: _size,
              onChanged: (v) {
                setState(() {
                  _size = v;
                });
              },
              max: 300,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[FileIcon(_input, size: _size)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
