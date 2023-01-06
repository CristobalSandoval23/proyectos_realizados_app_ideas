import 'dart:async';
import 'package:flutter/material.dart';

class PomodoroService extends ChangeNotifier{
      String segundos = "",
              minutos = "";
      Duration duration = const Duration(seconds: 60);
      bool permitir = false;
      bool resume = false;
      StreamSubscription<int>? _tickSubscriptionSegundos;

  timerStart(){
      notifyListeners();    
      (_tickSubscriptionSegundos?.isPaused ?? false)
      ?_tickSubscriptionSegundos?.resume()
      :_countDown(duration.inSeconds);
      notifyListeners();     
  }

 timerPause(){
      notifyListeners();
      _tickSubscriptionSegundos?.pause();
      notifyListeners();

  }
  timerCancel(){
    notifyListeners();
    _tickSubscriptionSegundos?.cancel();
      notifyListeners();

  }

  _countDown(int timer){
    notifyListeners();
    _tickSubscriptionSegundos?.cancel();
     _tickSubscriptionSegundos = Stream<int>.periodic(const Duration(seconds: 1), (sec)=> timer -sec -1)
      .take(timer)
      .listen((timerSeconds) {
        duration = Duration(seconds: timerSeconds);
        notifyListeners();
      });
  }

 String get timer {
       segundos = (duration.inSeconds % 60).floor().toString().padLeft(2,"0"); 
       minutos = ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, "0"); 

      return "$minutos:$segundos";
  }

}