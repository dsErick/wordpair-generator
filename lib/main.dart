import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primaryColor: Colors.lightBlue[600],
            ),
            home: RandomWords(),
        );
    }
}

class RandomWords extends StatefulWidget {
    @override
    RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
    final List<WordPair> _randomWordPairs = <WordPair>[];

    Widget _buildList() {
        return ListView.builder(
            padding: const EdgeInsets.only(top: 4),
            // itemCount: _randomWordPairs.length,
            itemBuilder: (_, int i) {
                if (i.isOdd) {
                    return Divider();
                }

                final index = i ~/ 2;

                if (index >= _randomWordPairs.length) {
                    _randomWordPairs.addAll(generateWordPairs().take(10));
                }

                return _buildRow(_randomWordPairs[index]);
            },
        );
    }

    Widget _buildRow(WordPair wordpair) {
        return ListTile(
            title: Text(
                wordpair.asPascalCase,
                style: const TextStyle(fontSize: 18)
            ),
            // trailing: Icon(Icons.star_rate),
        );
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('WordPair Generator')
            ),
            body: _buildList()
        );
    }
}
