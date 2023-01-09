import 'package:flutter/material.dart';

class ContadorPalabrasPage extends StatefulWidget {
  const ContadorPalabrasPage({super.key});

  @override
  State<ContadorPalabrasPage> createState() => _ContadorPalabrasPageState();
}

class _ContadorPalabrasPageState extends State<ContadorPalabrasPage> {
    String text = "";
    List<TableRow> tableRow = [];
    Map<String, int>  listaPalabras = {};
    bool limpiar = false;
    int contadorPalabras = 0;
  @override
  void initState() {
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
      body: SingleChildScrollView(
        child: Column(
          children:  [
            const Text("Contador de palabras"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value)=> text = value,
                minLines: 10,
                maxLines: 10,
              ),
            ),
            const SizedBox(height: 10,),
             Card(child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  listaPalabras.clear();
                    setState(() {
                  final stringList = text.split(" ");

                 for (var element in stringList.toSet().toList()) {

                      stringList.forEach((e) { 
                            if(e == element)contadorPalabras++;
                      });
                    if(element != "" ) listaPalabras.addAll({element:contadorPalabras});
                    contadorPalabras = 0;
                 }
                    });
                },
                child: const Text("Contar palabras del texto")),
            ),),
            const SizedBox(height: 10,),
            Table(
                children: [
                  TableRow(
                    children: [
                        Container(alignment: Alignment.center, height: 20, color: Colors.red,child: const Text("Rank"),),
                        Container(alignment: Alignment.center,height: 20, color: Colors.red,child: const Text("Count"),),
                        Container(alignment: Alignment.center, height: 20, color: Colors.red,child: const Text("Word"),),
                    ]
                  ),
                
                ],
            ),
            Table(
                children: data()
            ),
          ],
        ),
      ),
    );
  }


List<TableRow> data() {
  return List.generate(listaPalabras.length, (index) => 
  TableRow(
                  children: [
                      Container(alignment: Alignment.center, height: 20, color: Colors.red,child: Text("${index+1}"),),
                      Container(alignment: Alignment.center,height: 20, color: Colors.red,child:  Text("${listaPalabras.values.toList()[index]}"),),
                      Container(alignment: Alignment.center, height: 20, color: Colors.red,child: Text(listaPalabras.keys.toList()[index]),),
                  ]
                ),);
}
}
