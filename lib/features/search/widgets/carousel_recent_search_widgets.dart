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

class CarouselRecentSearch extends StatefulWidget {
  const CarouselRecentSearch({Key? key}) : super(key: key);

  @override
  State<CarouselRecentSearch> createState() => _CarouselRecentSearchState();
}

class _CarouselRecentSearchState extends State<CarouselRecentSearch> {
  List<Product>? productList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchTest();
  }

  fetchTest() async {
    productList = await homeServices.fetchTest(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.white,
          child: headerDoubleText(
            textHeader: 'Historial Click',
            textAction: 'Ver mas',
          ),
        ),
        productList == null
            ? const Loader()
            : Container(
                color: GlobalVariables.backgroundColor,
                child: SizedBox(
                  height: 135,
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
                          width: 135,
                          child: Column(
                            children: [
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
      ],
    );
  }
}
