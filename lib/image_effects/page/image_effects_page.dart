import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectos_flutter/image_effects/provider/image_effects_provider.dart';


class ImageEffectsPage extends StatefulWidget {
  @override
  State<ImageEffectsPage> createState() => _ImageEffectsPageState();
}

class _ImageEffectsPageState extends State<ImageEffectsPage> {
    String url = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children:  [
           Expanded(
            flex: 1,
             child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
               child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: elementosAgregador(context)
                       ),
             ),
           ),
          Expanded(
            flex: 2,
            child: (url.isEmpty) ? Container(color: Colors.black,) : Image.network(url)
          )
        ],
      ),
    );
  }

List<Widget> elementosAgregador(BuildContext context) {

   final List<Widget> elementosCard =  List.generate(10, (index) => 

     GestureDetector(
       onTap: () {
         url = "https://picsum.photos/id/1$index/${widthAndHeight(context)}";
    setState(() {
      
    });
         print(url);
       }, 
       child: Card(
          elevation: 10,
          shadowColor: Colors.black,
          color: Colors.blue,
          child: Image.network(
            "https://picsum.photos/id/1$index/150/100"
          ),
          ),
     )

    );
    return elementosCard;
}
}


String widthAndHeight(BuildContext context){
  final width = MediaQuery.of(context).size.width.ceilToDouble(); 
  final height = (MediaQuery.of(context).size.height/2).ceilToDouble(); 

    return "$width/$height";
}
