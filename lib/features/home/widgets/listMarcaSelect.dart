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

class ListMarca extends StatefulWidget {
  const ListMarca({Key? key}) : super(key: key);

  @override
  State<ListMarca> createState() => _ListMarcaState();
}

class _ListMarcaState extends State<ListMarca> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchMarcaProducts();
  }

  fetchMarcaProducts() async {
    productList = await homeServices.fetchMarcaProducts(
      context: context,
      marca: 'Apple',
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            color: Colors.white,
            child: headerDoubleText(
              textHeader: 'Apple',
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
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  width: 200,
                                  height: 120,
                                  child: productList == null
                                      ? const Loader()
                                      : SingleProduct(
                                          imagen: product.images[0],
                                        ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Text(
                                          product.name,
                                          style: const TextStyle(
                                            color: Color(0xff1C2833),
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.4,
                                            fontSize: 12.0,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Text(
                                          product.marca,
                                          style: const TextStyle(
                                            color: Color(0xff1C2833),
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: 0.4,
                                            fontSize: 11.0,
                                          ),
                                          textAlign: TextAlign.start,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '\$${product.price}',
                                          style: const TextStyle(
                                            color: GlobalVariables
                                                .colorPriceSecond,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 0.5,
                                            fontSize: 14.0,
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
                )
        ],
      ),
    );
  }
}
