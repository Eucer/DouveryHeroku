import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/home/screens/categoryDealsScreen.dart';
import 'package:v1douvery/features/home/services/homeServices.dart';
import 'package:v1douvery/features/pruductDetails/screens/productDetailsScrenn.dart';
import 'package:v1douvery/models/product.dart';
import 'package:v1douvery/models/user.dart';
import 'package:v1douvery/provider/user_provider.dart';

class CardsOneWidget extends StatefulWidget {
  const CardsOneWidget({Key? key}) : super(key: key);

  @override
  State<CardsOneWidget> createState() => _CardsOneWidget();
}

class _CardsOneWidget extends State<CardsOneWidget> {
  double scrollPosition = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 10,
          ),
          child: ClipRRect(
            child: Container(
              height: 180,
              color: const Color(0xffC70039),
              width: 85.0,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Text(
                        'Articulos Nuevos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffe9ebee),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: const Text(
                        'Ver mas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xffe9ebee),
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliderCards(),
      ],
    );
  }
}

class SliderCards extends StatefulWidget {
  @override
  State<SliderCards> createState() => _SliderCardsState();
}

class _SliderCardsState extends State<SliderCards> {
  PageController _controller = PageController(
    viewportFraction: 0.4,
  );

  List<Product>? productList;

  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchNewProducts();
  }

  fetchNewProducts() async {
    productList = await homeServices.fetchNewProducts(
      context: context,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(left: 100.0, top: 5.0, right: 0, bottom: 0),
        child: CarouselProductToNamedCategory(
          productList: productList,
        ),
      );
}

class CarouselProductToNamedCategory extends StatelessWidget {
  const CarouselProductToNamedCategory({
    Key? key,
    required this.productList,
  }) : super(key: key);

  final List<Product>? productList;

  @override
  Widget build(BuildContext context) {
    //edit modal

    return productList == null
        ? const Loader()
        : Container(
            color: GlobalVariables.backgroundColor,
            child: SizedBox(
              height: 180,
              width: double.infinity,
              child: ListView.builder(
                itemCount: productList!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final product = productList![index];

                  void _modalInteriorFerce(BuildContext context) {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext bc) {
                        final product = productList![index];
                        return Container(
                          height: 600,
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 200,
                                child: CachedNetworkImage(
                                    imageUrl: product.images[0]),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 14.0, bottom: 5),
                                width: 120.0,
                                height: 30,
                                child: Text(
                                  'Descrop',
                                  style: TextStyle(
                                      color: Color(0xff1C2833),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      fontSize: 12.0),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

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
                      decoration: const BoxDecoration(
                        border: Border(
                            left: BorderSide(
                          color: GlobalVariables.colorTextGreylv10,
                          width: 1,
                        )),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              margin: const EdgeInsets.only(top: 2.0),
                              width: 130.0,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 5, bottom: 5),
                                child: Center(
                                  child: Text(
                                    product.name,
                                    style: TextStyle(
                                      color: Color(0xff1C2833),
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.4,
                                      fontSize: 11.0,
                                    ),
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 120.0,
                            height: 100.0,
                            child: productList == null
                                ? const Loader()
                                : SingleProduct(
                                    imagen: product.images[0],
                                  ),
                          ),
                          Container(
                            height: 30,
                            width: 120.0,
                            color: Color(0xffFffffff),
                            child: FlatButton(
                              onPressed: () {
                                _modalInteriorFerce(context);
                              },
                              child: Icon(Icons.keyboard_control),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
  }
}
