import 'package:flutter/material.dart';

import 'random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.lightBlue[600],
                dividerColor: Colors.grey[400]
            ),
            home: RandomWords(),
        );
    }
}

