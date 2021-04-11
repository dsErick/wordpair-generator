import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(
                // brightness: Brightness.dark,
                primaryColor: Colors.lightBlue[600],
            ),
            home: Scaffold(
                appBar: AppBar(
                    title: Text('WordPair Generator'),
                ),
                body: Center(
                    child: Text(
                        'Hello World',
                        style: Theme.of(context).textTheme.headline2
                    )
                ),
            ),
            debugShowCheckedModeBanner: false,
        );
    }
}