import 'package:animate_do/animate_do.dart';
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';
import 'package:v1douvery/NAV/topTitleButtom.dart';
import 'package:v1douvery/common/widgets/bottom_bar.dart';
import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/home/widgets/carAll.dart';
import 'package:v1douvery/features/home/widgets/carKits.dart';

import 'package:v1douvery/features/home/widgets/listMarcaSelect.dart';
import 'package:v1douvery/features/home/widgets/listNew.dart';
import 'package:v1douvery/features/home/widgets/banner_widget.dart';
import 'package:v1douvery/features/home/widgets/deal-of-day.dart';
import 'package:v1douvery/features/home/widgets/listDealOfDay.dart';

import 'package:v1douvery/features/home/widgets/listRandom.dart';
import 'package:v1douvery/features/home/widgets/listRecomend.dart';
import 'package:v1douvery/features/home/widgets/testing.dart';

import 'package:v1douvery/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userCartLen = context.watch<UserProvider>().user.cart.length;

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,

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
              Badge(
                toAnimate: false,
                position: BadgePosition.topEnd(top: 2, end: 3),
                animationDuration: Duration(milliseconds: 300),
                badgeColor: Color(0xffe84118),
                badgeContent: Text(
                  userCartLen.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
                child: IconButton(
                  icon: const Icon(IconlyLight.buy),
                  onPressed: () {},
                ),
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              NavCategory(),
              BannerWidget(),
              CardsOneWidget(),
              ListDealOfDay(),
              DealOfDay(),
              ListRandom(),
              RecomendProduct(),
              ListMarca(),
              CarKitsProductOne(),
              DealOfDay(),
              DealOfDay(),
              DealOfDay(),
            ],
          ),
        ),
      ),
    );
  }
}
