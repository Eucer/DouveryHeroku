import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';
import 'package:v1douvery/NAV/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/custon_button.dart';
import 'package:v1douvery/common/widgets/loader.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/address/screens/addresScreens.dart';
import 'package:v1douvery/features/cart/widgets/cardProduct.dart';
import 'package:v1douvery/features/cart/widgets/cartSubTotal.dart';
import 'package:v1douvery/features/home/widgets/deal-of-day.dart';
import 'package:v1douvery/features/pruductDetails/screens/productDetailsScrenn.dart';
import 'package:v1douvery/provider/user_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    user.cart
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();

    return Scaffold(
      backgroundColor: GlobalVariables.backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(105),
        child: Center(
          child: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Text(
                  'Douvery ',
                  style: GoogleFonts.lato(
                      color: Color(0xffFCFCFC), fontWeight: FontWeight.bold),
                ),
                Icon(Icons.wifi_2_bar_sharp),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(IconlyLight.addUser),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(15),
              child: CenterSearchNav(),
            ),
            backgroundColor: GlobalVariables.appBarbackgroundColor,
          ),
        ),
      ),

      //SelectBody
      body: user == null
          ? const Loader()
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      autofocus: false,
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffed174f), // background
                        // foreground
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressScreen(
                            totalAmount: sum.toString(),
                            cantid: user.cart.length.toString(),
                          ),
                        ),
                      ),
                      icon: Icon(Icons.payments, size: 36),
                      label: Text(
                        "Proceed to Buy (${user.cart.length} items)",
                      ),
                    ),
                  ),
                  CartSubtotal(),
                  const SizedBox(height: 15),
                  Container(
                    color: Colors.black12.withOpacity(0.08),
                    height: 1,
                  ),
                  Container(
                    color: GlobalVariables.greyBackgroundCOlor,
                    height: 450,
                    child: ListView.builder(
                      itemCount: user.cart.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          child: CartProduct(
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
