import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  int pageCurrent = 0;
  int pageTotal = 3;
  late PageController controllerPage;
  @override
  void initState() {
    controllerPage = PageController(
      initialPage: pageCurrent
    );

    super.initState();
  }

  @override
  void dispose() {
    controllerPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(pageTotal, (index) => GestureDetector(
              onTap: () {
                pageCurrent = index;
                controllerPage.animateToPage(
                  pageCurrent, 
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width/3.5,
                    color: Colors.amber,
                    child: Center(child: Text(index.toString())),
                  ),
              ),
            )),),
          SizedBox( 
            height: MediaQuery.of(context).size.height/2,     
            child: PageView.builder(
              controller: controllerPage,
              itemCount: pageTotal,
              itemBuilder: (context, index) {
              return Container(
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(index.toString()),
                    Center(child: Image.network("https://random.imagecdn.app/150/100")),
                  ],
                ),);
              }),
            ),
        ],
      ),
    );
  }
}