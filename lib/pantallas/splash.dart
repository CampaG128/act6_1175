import 'package:campa1175/datos/datos_producto.dart';
import 'package:flutter/material.dart';

class PantallaSplash extends StatefulWidget {
  const PantallaSplash({Key? key}) : super(key: key);

  @override
  State<PantallaSplash> createState() => _PantallaSplashState();
}

class _PantallaSplashState extends State<PantallaSplash> {
  int paginaActual = 0;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Container(
          height: height * 0.95,
          width: width * 0.95,
          color: Colors.blueGrey,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                        onPageChanged: (pagina) {
                          setState(() {
                            paginaActual = pagina;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 300,
                                width: 300,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(productos[index].img),
                                  ),
                                ),
                              ),
                              Text(
                                productos[index].title,
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                productos[index].description,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            ],
                          );
                        })),
                SizedBox(
                  height: 10,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: paginaActual == index ? 25 : 10,
                            color: paginaActual == index
                                ? Colors.red
                                : Colors.white);
                      }),
                ),
                ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
