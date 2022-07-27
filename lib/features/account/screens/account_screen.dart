import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:v1douvery/NAV/bottomNavSearchTitle.dart';
import 'package:v1douvery/NAV/centerSearchNav.dart';
import 'package:v1douvery/NAV/topTitleButtom.dart';

import 'package:v1douvery/constantes/global_variables.dart';
import 'package:v1douvery/features/account/widgets/Nosession.dart';
import 'package:v1douvery/features/account/widgets/categoriasUser.dart';
import 'package:v1douvery/features/account/widgets/ordenesUser.dart';
import 'package:v1douvery/features/account/widgets/perfilUser.dart';
import 'package:v1douvery/features/account/widgets/WelcomeUser.dart';
import 'package:v1douvery/features/auth/screens/auth_screen.dart';
import 'package:v1douvery/features/search/vista/search_screen.dart';
import 'package:v1douvery/provider/user_provider.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
      body: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Session()
          : Nosession(),
    );
  }
}

class Session extends StatelessWidget {
  const Session({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeUser(),
          CategoriasUser(),
          PerfilUsuario(),
          OrdersUser(),
        ],
      ),
    );
  }
}

class Nosession extends StatelessWidget {
  const Nosession({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BottomNavSearchTitle(),
          NotSessions(),
          Container(
            child: IconButton(
              icon: GestureDetector(
                child: Icon(
                  IconlyLight.login,
                  color: GlobalVariables.colorRosaRojVivo,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthScreen(),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
