// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_teste/menu/menu.dart';
import 'package:projeto_teste/suspeito/suspeito.dart';
import '../suspeitos-data/suspects.dart';
import '../components/button.dart';

class Selecao extends StatefulWidget {
  const Selecao({super.key});

  @override
  State<Selecao> createState() => _SelecaoState();
}

class _SelecaoState extends State<Selecao> {
  int timeleft = 120;
  late Timer timer;
  CarouselController carouselController = CarouselController();
  int indexNow = 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        if (timeleft > 0) {
          timeleft--;
        } else {
          // lose game ------
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff2C2C2C),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          title: Padding(
            padding: EdgeInsets.only(left: 250),
            child: Text(
              "${(timeleft ~/ 60).toString().padLeft(2, '0')}:${(timeleft % 60).toInt().toString().padLeft(2, '0')}",
              style: GoogleFonts.inika(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Stack(children: [
          Align(
            alignment: Alignment(-1, 1),
            child: Image.asset("images/foot.png"),
          ),
          Column(
            children: <Widget>[
              CarouselSlider(
                carouselController: carouselController,
                items: suspeitos.map((suspeito) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Suspeito(suspect: suspeito)),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                          child: Image.asset(
                            suspeito.img,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeFactor: 0.15,
                  enlargeCenterPage: true,
                  height: 400,
                  onPageChanged: (index, reason) {
                    indexNow = index;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: ButtonGrayFunc(
                  context: context,
                  text: "Acusar",
                  onPressed: () {
                    // win game or lose -----------------
                    print(indexNow);
                  },
                ),
              ),
            ],
          ),
        ]));
  }
}
