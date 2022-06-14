import 'dart:async';

import 'package:block_agri_mart/application/constants/screen_constants.dart';
import 'package:block_agri_mart/application/state/app.dart';
import 'package:block_agri_mart/presentation/pages/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../application/components/components.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
  String name = "Explore";
  @override
  Widget build(BuildContext context) {
    print("Is Logged In: ${appStateManager.loggedIn}");
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            print("Height in layout: ${constraints.maxHeight}");
            print("Width in layout: ${constraints.maxWidth}");
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor.withOpacity(0.93),
                image: const DecorationImage(
                    opacity: 0.15,
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.darken),
                    image: AssetImage("assets/images/farm.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "Discover, buy and sell quality Agro-products and services.",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  LottieBuilder.asset(
                    "assets/lottie/two-factor-authentication.json",
                    width: width / 1.5,
                    height: height / 2.5,
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        "\n\nAgriMart is the world's and largest digital Argo-product marketplace.",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      )),
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: Text(
                        "You need an ethereum wallet to use AgriMart",
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.w600),
                      )),
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    alignment: Alignment.center,
                    child: CustomElevatedButton(
                      buttonBackgroundColor: Colors.teal.shade700,
                      buttonOutlineColor: Colors.teal.shade500,
                      title: "Connect to Wallet",
                      onPressed: () {
                        showModalBottomSheet(
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40))),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 20),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomElevatedButton(
                                      title: "Connect as Buyer",
                                      height: 45,
                                      width: 250,
                                      onPressed: () {
                                        showConnectDialog(userType: 'Buyer');
                                      },
                                      buttonBackgroundColor:
                                          Colors.brown.shade700,
                                      buttonOutlineColor: Colors.brown.shade500,
                                      titleStyle: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    CustomElevatedButton(
                                      title: "Connect as Seller",
                                      height: 45,
                                      onPressed: () {
                                        showConnectDialog(userType: 'Seller');
                                      },
                                      width: 250,
                                      buttonBackgroundColor: Colors.white,
                                      buttonOutlineColor: Colors.brown.shade500,
                                      titleStyle: TextStyle(
                                          color: Colors.brown.shade700,
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      elevation: 5,
                      onHover: (value) {},
                      titleStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                      height: 45,
                      width: width / 1.5,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  showConnectDialog({required String userType}) {
    double num = 45;
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "$userType: Select wallet ",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  CustomListTile(
                    title: 'MetaMusk',
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);

                      context.read<AppStateManager>().setIsLoggedIn(true);
                      Provider.of<AppStateManager>(context, listen: false)
                          .setIsLoggedIn(true);
                      print("Is Logged In: ${appStateManager.loggedIn}");
                      GoRouter.of(context).goNamed("home");
                      // Timer(const Duration(seconds: 5), () {

                      // });
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("BACK"),
                  )
                ],
              ),
            ),
          );
        });
  }
}
