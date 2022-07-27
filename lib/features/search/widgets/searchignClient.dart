import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/search/services/seachServices.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/features/search/widgets/MostrarSerchendProductsWidgets.dart';

import 'package:v1douvery/models/product.dart';

class SearchingPage extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  SearchingPage({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchSeachedProduct();
  }

  fetchSeachedProduct() async {
    products = await searchServices.fetchSearchedProduct(
        context: context, searchQuery: widget.searchQuery);
    setState(() {});
  }

  void navigateToSearchingScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(105),
        child: AppBar(
          elevation: 0,
          title: FadeInLeft(
            duration: const Duration(milliseconds: 300),
            from: 10,
            child: Text(
              'Buscador',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(IconlyLight.activity),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(IconlyLight.category),
              onPressed: () {},
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(15),
            child: SearchingWidget(),
          ),
          backgroundColor: GlobalVariables.appBarbackgroundColor,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: 30,
            decoration: const BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(color: Color.fromARGB(12, 0, 0, 0), width: 1),
              ),
              color: GlobalVariables.backgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 160,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      const Text(
                        'Buscar :',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 100,
                        child: Text(
                          widget.searchQuery,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          products == null
              ? const Loader()
              : Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: products == null
                            ? const Loader()
                            : SerchendWidgetsProducts(
                                product: products![index],
                              ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class SearchingWidget extends StatefulWidget {
  const SearchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchingWidget> createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
  void navigateToSearchingScreen(String query) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SearchingPage(
                searchQuery: query,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        height: 55,
        width: double.infinity,
        color: GlobalVariables.appBarbackgroundColor,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Material(
              child: TextFormField(
                onFieldSubmitted: navigateToSearchingScreen,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.fromLTRB(8, 5, 8, 0),
                  hintText: 'Buscar articulos...',
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
