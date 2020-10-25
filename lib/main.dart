import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

//Top headlines from Egypt
String _apiUrl1 =
    "https://newsapi.org/v2/top-headlines?country=eg&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top technology headlines from Egypt
String _apiUrl2 =
    "https://newsapi.org/v2/top-headlines?country=eg&category=technology&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top sports headlines from Egypt
String _apiUrl3 =
    "https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top science headlines from Egypt
String _apiUrl4 =
    "https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top entertainment headlines from Egypt
String _apiUrl5 =
    "https://newsapi.org/v2/top-headlines?country=eg&category=entertainment&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top health headlines from Egypt
String _apiUrl6 =
    "https://newsapi.org/v2/top-headlines?country=eg&category=health&apiKey=3594af218fb4471d89d6711b2f9cfe61";
//Top business headlines from Egypt
String _apiUrl7 =
    'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=3594af218fb4471d89d6711b2f9cfe61';
List _provider1;
List _provider2;
List _provider3;
List _provider4;
List _provider5;
List _provider6;
List _provider7;

void main() async {
  _provider1 = await fetchData(_apiUrl1);
  _provider2 = await fetchData(_apiUrl2);
  _provider3 = await fetchData(_apiUrl3);
  _provider4 = await fetchData(_apiUrl4);
  _provider5 = await fetchData(_apiUrl5);
  _provider6 = await fetchData(_apiUrl6);
  _provider7 = await fetchData(_apiUrl7);
  print("Fetched Data");

  runApp(new MaterialApp(
    home: new Categories(),
  ));
}

void _onTapMessage(
  BuildContext context,
  String details,
) {
  var alert = new AlertDialog(
    title: new Text(
      "الناشر",
      textAlign: TextAlign.center,
    ),
    content: new Text(
      details,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    ),
    actions: <Widget>[
      new FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(
            "اغلاق",
            style: new TextStyle(fontSize: 20.0),
          ))
    ],
  );
  showDialog(context: context, builder: (context) => alert);
}

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.orange.shade100,
        appBar: new AppBar(
          backgroundColor: Colors.orange,
          title: new Text(
            "News",
            style: new TextStyle(
                fontSize: 30.0,
                color: Colors.white,
                fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        body: new Center(
          child: new ListView(
            padding: new EdgeInsets.all(10.0),
            children: <Widget>[
              new Image.asset(
                './images/news.png',
                height: 220.0,
                width: 190.0,
              ),
              new Padding(padding: const EdgeInsets.all(5.5)),
              new Text(
                "Hey!\tTake a look at today news",
                textAlign: TextAlign.center,
                style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade900),
              ),
              new Padding(padding: const EdgeInsets.all(5.5)),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider1,
                              )));
                },
                child: new Text(
                  "Get Top Egypt Heads",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider2,
                              )));
                },
                child: new Text(
                  "Get Top Technology News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider3,
                              )));
                },
                child: new Text(
                  "Get Top Sport News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider4,
                              )));
                },
                child: new Text(
                  "Get Top Science News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider5,
                              )));
                },
                child: new Text(
                  "Get Top Entertainment News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider6,
                              )));
                },
                child: new Text(
                  "Get Top Health News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
              new RaisedButton(
                padding: new EdgeInsets.all(5.0),
                color: Colors.purple,
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Headlines(
                                provider: _provider7,
                              )));
                },
                child: new Text(
                  "Get Top Business News",
                  style: new TextStyle(
                      fontSize: 21.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ));
  }
}

class Headlines extends StatelessWidget {
  final List provider;

  Headlines({Key key, @required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: new AppBar(
        backgroundColor: Colors.red,
        title: new Text(
          "Headlines",
          textScaleFactor: 0.9,
        ),
        centerTitle: true,
      ),
      body: new Center(
        child: new ListView.builder(
          padding: new EdgeInsets.all(15.0),
          itemCount: provider.length,
          itemBuilder: (BuildContext context, int position) {
            if (position.isOdd)
              return new Divider(
                color: Colors.green.shade900,
              );
            final index = position ~/ 2;
            return new ListTile(
              leading: new Icon(
                Icons.fiber_new,
                color: Colors.red,
                size: 35.0,
              ),
              title: new Text(
                "${provider[index]["title"]}",
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: new Text(
                '${provider[index]["description"]}',
                textDirection: TextDirection.rtl,
                style: new TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                _onTapMessage(
                  context,
                  "${provider[index]["source"]["name"]}",
                );
              },
              onLongPress: () {
                final snackBar = new SnackBar(
                  content: new Text(
                    "${provider[index]["url"]}",
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.pink,
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }
}

Future<List> fetchData(String apiUrl) async {
  http.Response response = await http.get(apiUrl);
  return (json.decode(response.body))["articles"];
}
