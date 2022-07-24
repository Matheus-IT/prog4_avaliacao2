import 'package:flutter/material.dart';

import '../../consts/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
              height: screenSize * .75,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/background.png'),
                    fit: BoxFit.cover),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 165),
              child: SizedBox(
                height: 250,
                child: Image(image: AssetImage('assets/image/logo.png')),
              ),
            ),
            Container(
              alignment: const Alignment(-.5, 0),
              child: const SizedBox(
                  height: 180,
                  child: Image(image: AssetImage('assets/image/player.png'))),
            )
          ]),
          Stack(alignment: AlignmentDirectional.center, children: <Widget>[
            Container(
              alignment: const Alignment(.10, .90),
              height: screenSize * .25,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/bottom_image.png'),
                    fit: BoxFit.fill),
              ),
              child: const Text(
                'Matheus Costa, Thiago Vinicios',
                style: TextStyle(
                    fontSize: 18, color: kWhite, fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/game-page');
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(kButtonColor)),
                    child: const Text(
                      'Jogar',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
