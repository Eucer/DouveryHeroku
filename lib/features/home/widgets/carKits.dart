import 'package:flutter/material.dart';
import 'package:v1douvery/constantes/global_variables.dart';

class CarKitsProductOne extends StatelessWidget {
  const CarKitsProductOne({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: GlobalVariables.backgroundColor,
        width: 550,
        height: 250.0,
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            // Max Size Widget

            Positioned(
              top: 30,
              right: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    const Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://camposha.info/flutter/wp-content/uploads/sites/21/2021/06/28434468707_bdc890bd7e_app.jpg?ezimgfmt=ng%3Awebp%2Fngcb38%2Frs%3Adevice%2Frscb38-1'),
                    ),
                    Row(
                      children: const [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 5.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Middle Widget',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 14, 1, 1),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\$150.0',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 114, 187),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 140,
              right: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  children: [
                    Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://media.istockphoto.com/photos/blue-plastic-spiny-massage-ball-isolated-on-white-concept-of-or-of-picture-id1356540619'),
                    ),
                    Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Middle Widget',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 17, 1, 1),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\$150.0',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 114, 187),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 102,
              left: 15,
              child: Container(
                height: 50,
                width: 80,
                child: Center(
                  child: Text(
                    '+',
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 13, 13), fontSize: 20),
                  ),
                ),
              ),
            ),

            Positioned(
                top: 30,
                left: 10,
                child: Container(
                  height: 100,
                  width: 160,
                  color: Color.fromARGB(255, 255, 253, 253),
                  child: Column(
                    children: [
                      Image(
                        width: 150,
                        height: 80.0,
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://camposha.info/flutter/wp-content/uploads/sites/21/2021/06/28434468707_bdc890bd7e_app.jpg?ezimgfmt=ng%3Awebp%2Fngcb38%2Frs%3Adevice%2Frscb38-1'),
                      ),
                      Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5.0, top: 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Middle Widget',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 17, 1, 1),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 3),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '\$150.0',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 5, 114, 187),
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 140,
              left: 10,
              child: Container(
                height: 100,
                width: 160,
                color: Color.fromARGB(255, 253, 253, 253),
                child: Column(
                  children: [
                    Image(
                      width: 150,
                      height: 80.0,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://camposha.info/flutter/wp-content/uploads/sites/21/2021/06/28434468707_bdc890bd7e_app.jpg?ezimgfmt=ng%3Awebp%2Fngcb38%2Frs%3Adevice%2Frscb38-1'),
                    ),
                    Row(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Middle Widget',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 17, 1, 1),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '\$150.0',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 5, 114, 187),
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
