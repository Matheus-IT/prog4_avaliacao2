import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prog4_avaliacao2/core/app_routes.dart';

import '../../consts/colors.dart';
import 'components/result_box.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var resultBoxSize = MediaQuery.of(context).size.height;
    int totalWords = 3;
    int correctWords = 2;
    int wrongWords = 1;
    String numWords = totalWords.toString();
    String playerGoals = correctWords.toString();
    String playerFails = wrongWords.toString();
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
                      child: SvgPicture.asset('assets/image/icon/trophy.svg')),
                  const Text(
                    'Vitoria!',
                    style: TextStyle(
                        color: kDarkText,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
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
                        ResultBox(values: numWords, title: 'Palavras'),
                        const VerticalDivider(
                          thickness: 2,
                          width: 15,
                        ),
                        ResultBox(values: playerGoals, title: 'Acertos'),
                        const VerticalDivider(
                          thickness: 2,
                          width: 15,
                        ),
                        ResultBox(values: playerFails, title: 'Erros'),
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
