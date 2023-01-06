import 'package:flutter/material.dart';

class ImageEffectsProvider extends ChangeNotifier {
     

     String imagenUrl(String url){
        notifyListeners();
          return url;
      }
}