import 'dart:async';

import 'package:flutter/material.dart';

class CountDownProvider extends ChangeNotifier{

    double segundos = 0.0;
    double minutos = 0.0;
    double horas = 0.0;
    double dias = 0.0;
    Duration duration = const Duration(seconds: 60);
    bool permitir = false;
    StreamSubscription<int>? _tickSubscriptionSegundos;
    StreamSubscription<int>? _tickSubscriptionMinutos;
  

  timerStart(){
    if (permitir) {
      print(duration.inSeconds);
      CountDown(duration.inSeconds);
      CountDownMinutos(duration.inSeconds);
    } else {
      _tickSubscriptionSegundos?.pause();  
    }
  }

  CountDown(int timer){
    _tickSubscriptionSegundos?.cancel();
     _tickSubscriptionSegundos = Stream<int>.periodic(const Duration(seconds: 1), (sec)=> timer -sec -1)
      .take(timer)
      .listen((timerSeconds) {
        print(timerSeconds);
        duration = Duration(seconds: timerSeconds);
        notifyListeners();
      });
  }

  CountDownMinutos(int timer){
    _tickSubscriptionMinutos?.cancel();
     _tickSubscriptionMinutos = Stream<int>.periodic(const Duration(minutes: 1), (sec)=> timer -sec -1)
      .take(timer)
      .listen((timerSeconds) {
        print(timerSeconds);
        duration = Duration(seconds: timerSeconds);
        notifyListeners();
      });
  }

  double get segundo {
       segundos = (duration.inSeconds % 60); 
      return segundos;
  }
  double get minuto {
       minutos = (duration.inSeconds / 60) % 60; 
       print(minutos);
      return minutos;
  }

}

