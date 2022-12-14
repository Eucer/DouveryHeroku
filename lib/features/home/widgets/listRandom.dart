import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1douvery/common/widgets/header_double.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';

class ListRandom extends StatefulWidget {
  const ListRandom({Key? key}) : super(key: key);

  @override
  State<ListRandom> createState() => _ListRandomState();
}

class _ListRandomState extends State<ListRandom> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchListradomn();
  }

  fetchListradomn() async {
    productList = await homeServices.fetchListradomn(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: Colors.white,
            child: headerDoubleText(
              textHeader: 'Menos de ' + r'$100',
              textAction: 'Ver mas',
            ),
          ),
          productList == null
              ? const Loader()
              : Container(
                  color: GlobalVariables.backgroundColor,
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: productList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final product = productList![index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                product: product,
                              ),
                            ),
                          ),
                          child: Container(
                            width: 150,
                            child: Column(
                              children: [
                                Align(
                                  child: Container(
                                      child: Icon(
                                    Icons.price_change,
                                    color: Color.fromARGB(176, 255, 3, 100),
                                  )),
                                ),
                                Container(
                                  width: 135.0,
                                  height: 110.0,
                                  child: productList == null
                                      ? const Loader()
                                      : Column(
                                          children: [
                                            SingleProduct(
                                              imagen: product.images[0],
                                            ),
                                          ],
                                        ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            product.name,
                                            style: const TextStyle(
                                              color: Color(0xff1C2833),
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.4,
                                              fontSize: 11.0,
                                            ),
                                            textAlign: TextAlign.start,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 60.0, bottom: 0.0),
                                        child: Text(
                                          r'$' + product.price.toString(),
                                          style: GoogleFonts.roboto(
                                            color: Color(0xff1C2833),
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.4,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
