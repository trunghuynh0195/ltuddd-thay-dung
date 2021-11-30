import 'dart:math';
import 'package:flutter/material.dart';
import 'package:game/button.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late List<Button> buttonsList;
  List? player1;
  List? player2;
  int? activePlayer;

  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<Button> doInit() {
    player1 = [];
    player2 = [];
    activePlayer = 1;

    var buttons = <Button>[
      Button(id: 1),
      Button(id: 2),
      Button(id: 3),
      Button(id: 4),
      Button(id: 5),
      Button(id: 6),
      Button(id: 7),
      Button(id: 8),
      Button(id: 9),
    ];
    return buttons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0),
                itemCount: buttonsList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5);
                          } else if (states.contains(MaterialState.disabled)) {
                            return buttonsList[i].bg;
                          }
                          return Colors.grey;
                        },
                      ),
                    ),
                    onPressed: buttonsList[i].enabled
                        ? () => playGame(buttonsList[i])
                        : null,
                    child: Text(
                      buttonsList[i].text,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: resetGame,
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20.0),
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ));
  }

  void playGame(Button gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1!.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2!.add(gb.id);
      }
      gb.enabled = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonsList.every((p) => p.text != "")) {
          showDialog(
            context: context,
            builder: (_) => Dialog(
              child: Container(
                  height: 200,
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Game Tied",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          resetGame();
                        },
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 50,
                            width: 100,
                            child: const Text('Reset',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.white))),
                      ),
                    ],
                  )),
            ),
          );
        } else {
          activePlayer == 2 ? autoPlay() : null;
        }
      }
    });
  }

  void autoPlay() {
    var emptyCells = [];
    var list = List.generate(9, (i) => i + 1);
    for (var cellID in list) {
      if (!(player1!.contains(cellID) || player2!.contains(cellID))) {
        emptyCells.add(cellID);
      }
    }

    var r = Random();
    var randIndex = r.nextInt(emptyCells.length - 1);
    var cellID = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p) => p.id == cellID);
    playGame(buttonsList[i]);
  }

  int checkWinner() {
    var winner = -1;
    if (player1!.contains(1) && player1!.contains(2) && player1!.contains(3)) {
      winner = 1;
    }
    if (player2!.contains(1) && player2!.contains(2) && player2!.contains(3)) {
      winner = 2;
    }

    if (player1!.contains(4) && player1!.contains(5) && player1!.contains(6)) {
      winner = 1;
    }
    if (player2!.contains(4) && player2!.contains(5) && player2!.contains(6)) {
      winner = 2;
    }

    if (player1!.contains(7) && player1!.contains(8) && player1!.contains(9)) {
      winner = 1;
    }
    if (player2!.contains(7) && player2!.contains(8) && player2!.contains(9)) {
      winner = 2;
    }

    if (player1!.contains(1) && player1!.contains(4) && player1!.contains(7)) {
      winner = 1;
    }
    if (player2!.contains(1) && player2!.contains(4) && player2!.contains(7)) {
      winner = 2;
    }

    if (player1!.contains(2) && player1!.contains(5) && player1!.contains(8)) {
      winner = 1;
    }
    if (player2!.contains(2) && player2!.contains(5) && player2!.contains(8)) {
      winner = 2;
    }

    if (player1!.contains(3) && player1!.contains(6) && player1!.contains(9)) {
      winner = 1;
    }
    if (player2!.contains(3) && player2!.contains(6) && player2!.contains(9)) {
      winner = 2;
    }

    if (player1!.contains(1) && player1!.contains(5) && player1!.contains(9)) {
      winner = 1;
    }
    if (player2!.contains(1) && player2!.contains(5) && player2!.contains(9)) {
      winner = 2;
    }

    if (player1!.contains(3) && player1!.contains(5) && player1!.contains(7)) {
      winner = 1;
    }
    if (player2!.contains(3) && player2!.contains(5) && player2!.contains(7)) {
      winner = 2;
    }

    if (winner != -1) {
      if (winner == 1) {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Container(
                height: 200,
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Player 1 Win",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        resetGame();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: 100,
                          child: const Text('Reset',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.white))),
                    ),
                  ],
                )),
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Container(
                height: 200,
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Player 2 Win",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        resetGame();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 50,
                          width: 100,
                          child: const Text('Reset',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: Colors.white))),
                    ),
                  ],
                )),
          ),
        );
      }
    }

    return winner;
  }

  void resetGame() {
    setState(() {
      buttonsList = doInit();
    });
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }
}
