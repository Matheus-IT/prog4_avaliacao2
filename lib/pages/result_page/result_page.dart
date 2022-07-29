import 'package:flutter/material.dart';
import '../../core/app_routes.dart';

import '../../consts/colors.dart';
import 'components/result_box.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var resultBoxSize = MediaQuery.of(context).size.height;

    final gameStatus =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    final playerWon = gameStatus['playerWon'] as bool;
    final guessedWord = gameStatus['guessedWord'] as String;
    final wordHint = gameStatus['hint'] as String;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: kWhite),
              height: resultBoxSize * .80,
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 100,
                    width: 225,
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
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ResultBox(
                          values: playerWon ? 'Jogador' : 'Computador',
                          title: 'Vencedor',
                        ),
                        const VerticalDivider(
                          thickness: 2,
                          width: 15,
                        ),
                        ResultBox(values: guessedWord, title: 'Palavra'),
                        const VerticalDivider(
                          thickness: 2,
                          width: 15,
                        ),
                        ResultBox(values: wordHint, title: 'Dica'),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(kResultButton)),
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(AppRoutes.gamePage);
                      },
                      child: const Text('Jogar Novamente')),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
