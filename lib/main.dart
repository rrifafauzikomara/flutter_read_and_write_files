import 'package:flutter/material.dart';
import 'file_utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Operations Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'File Operations'),
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

  String fileContents = "No Data";
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: myController,
            ),
            RaisedButton(
              child: Text('Save to File'),
              onPressed: () {
                FileUtils.saveToFile(myController.text);
              },
            ),
            RaisedButton(
              child: Text('Read from File'),
              onPressed: () {
                FileUtils.readFromFile().then((contents) {
                  setState(() {
                    fileContents = contents;
                  });
                });
              },
            ),
            Text(fileContents),
          ],
        ),
      ),
    );
  }
}
