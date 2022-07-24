import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int lives = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: kButtonColor,
        backgroundColor: kForegroundColor,
        leading: const Icon(Icons.star),
        actions: [
          const Icon(Icons.favorite),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 10, top: 16),
            child: Text(
              '$lives',
              style: const TextStyle(fontSize: 18, color: kWhite),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar'))
        ]),
      ),
    );
  }
}
