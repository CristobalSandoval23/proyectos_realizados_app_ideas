import 'dart:html';

import 'package:flutter/material.dart';

class SquizAppPage extends StatefulWidget {
  const SquizAppPage({super.key});

  @override
  State<SquizAppPage> createState() => _SquizAppPageState();
}

   int length = 4;
class _SquizAppPageState extends State<SquizAppPage> {
   int selecionado = length + 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(Icons.info),
                        Text( "Question No.7 of 10")
                      ],
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Card(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("00"),
                    ),),
                    Card(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("04"),
                    ),),
                    Card(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("18"),
                    ),),
                  ],
                )
              ],
            ),
            Card(
              elevation: 6,
              child: Row(
              children: const [
                  Icon(Icons.search),
                  Text( "lorem ldadaldnal lakdnad dmas dlsd aslks ")
                ],
              ),
            ),
            Container(
              decoration:const  BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1)),),
              child: const Text("PLease choose one of the following answers:"),

            ),
            Column(
              children:
              List.generate(length, (index) => GestureDetector(
                onTap: () {
                  selecionado = index;
                  setState(() {
                    
                  });
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration( 
                    color: (selecionado == index) ?Colors.red: Colors.white, 
                    border: Border.all(color: Colors.grey)
                    ),child: Text("$index"),),
              )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.grey)),
                  height: 30,
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                  Text("Next"),
                  Icon(Icons.arrow_circle_right_outlined)
                ],)),
              ),
            )
          ],
        ),
      ),
    );
  }
}