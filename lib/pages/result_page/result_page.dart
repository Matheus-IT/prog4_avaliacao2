import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

import '../../consts/colors.dart';
import 'components/result_box.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var deviceScreenHeight = MediaQuery.of(context).size.height;

    final gameStatus =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final playerWon = gameStatus['playerWon'] as bool;
    final guessedWord = gameStatus['guessedWord'] as String;
    final wordHint = gameStatus['hint'] as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kWhite),
          height: deviceScreenHeight,
          child: Column(
            children: [
              SizedBox(
                height: deviceScreenHeight * 0.2,
                child: playerWon
                    ? Image.asset('assets/image/icon/trophy.png')
                    : Image.asset('assets/image/icon/lose.png'),
              ),
              Text(
                playerWon ? 'Vitoria!' : 'Derrota!',
                style: const TextStyle(
                  color: kDarkText,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(
                indent: 15,
                endIndent: 15,
                thickness: 2,
              ),
              Column(
                children: [
                  ResultBox(
                    values: playerWon ? 'Jogador' : 'Computador',
                    title: 'Vencedor',
                  ),
                  ResultBox(
                    values: guessedWord,
                    title: 'Palavra',
                  ),
                  ResultBox(
                    values: wordHint,
                    title: 'Dica',
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kResultButton)),
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.gamePage),
                child: const Text('Jogar Novamente'),
              ),
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.homePage),
                icon: const Icon(Icons.home),
                color: kKeyboardFrameColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
