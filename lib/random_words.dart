import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
    @override
    _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
    final List<WordPair> _randomWordPairs = <WordPair>[];
    final Set<WordPair> _savedWordPairs = Set<WordPair>();
    final TextStyle _wordPairStyle = TextStyle(fontSize: 18);

    Widget _buildList() {
        return ListView.builder(
            padding: const EdgeInsets.only(top: 4),
            itemBuilder: (_, int i) {
                if (i.isOdd) {
                    return const Divider();
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
        final alreadySaved = _savedWordPairs.contains(wordpair);

        return ListTile(
            title: Text(wordpair.asPascalCase, style: _wordPairStyle),
            trailing: Icon(
                alreadySaved
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: alreadySaved ? Colors.red[700] : null
            ),
            onTap: () => setState(() {
                if (alreadySaved) {
                    _savedWordPairs.remove(wordpair);
                } else {
                    _savedWordPairs.add(wordpair);
                }
            }),
        );
    }

    void _pushSaved() {
        Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (BuildContext context) {
                final Iterable<Widget> tiles = _savedWordPairs.map((WordPair wordpair) {
                    return ListTile(
                        title: Text(wordpair.asPascalCase, style: _wordPairStyle)
                    );
                });

                final List<Widget> divided = ListTile.divideTiles(
                    context: context,
                    tiles: tiles
                ).toList();

                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Saved WordPairs')
                    ),
                    body: ListView(
                        children: divided,
                    ),
                );
            },
        ));
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('WordPair Generator'),
                actions: <Widget>[
                    IconButton(
                        icon: Icon(Icons.list),
                        onPressed: _pushSaved,
                    ),
                ],
            ),
            body: _buildList()
        );
    }
}