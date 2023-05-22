import 'dart:math';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int x = 1;
  int? count;
  int playpoints = 0;
  int apppoint = 0;
  String mensagem = "Escolha uma opção";
  String reiniciar = "images/restart.png";
  String image = "images/interrogacao.png";
  List options = ["pedra", "papel", "tesoura"];

  void zerotozero() {
    setState(() {
      playpoints = 0;
      apppoint = 0;
    });
  }

  void _start(String escolha) {
    int k = Random().nextInt(options.length);

    String random = options[k];
    image = "images/$random.png";
    if ((escolha == "pedra" && random == "tesoura") ||
        (escolha == "papel" && random == "pedra") ||
        (escolha == "tesoura" && random == "papel")) {
      //usuario venceu
      setState(() {
        mensagem = "você ganhou";
        playpoints++;
      });
    } else if ((escolha == "pedra" && random == "papel") ||
        (escolha == "papel" && random == "tesoura") ||
        (escolha == "tesoura" && random == "pedra")) {
      //usuario perdeu
      setState(() {
        mensagem = "você perdeu";
        apppoint++;
      });
    } else {
      // empate
      setState(() {
        mensagem = "empate";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("jokenpô"),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 150),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do computador",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset(
            image,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              mensagem,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _start("pedra"),
                child: Image.asset("images/pedra.png", height: 70),
              ),
              GestureDetector(
                onTap: () => _start("papel"),
                child: Image.asset("images/papel.png", height: 70),
              ),
              GestureDetector(
                onTap: () => _start("tesoura"),
                child: Image.asset("images/tesoura.png", height: 70),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Vitórias->$playpoints-$apppoint<-Derrotas",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
              onTap: () => zerotozero(),
              child: Image.asset(
                reiniciar,
                height: 30,
              )),
        ]),
      ),
    );
  }
}
