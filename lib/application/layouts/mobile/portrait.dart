import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../components/components.dart';
import '../../state/app.dart';

class MobilePortrait extends StatefulWidget {
  final height;
  final width;
  const MobilePortrait({Key? key, this.height, this.width}) : super(key: key);

  @override
  State<MobilePortrait> createState() => _MobilePortraitState();
}

class _MobilePortraitState extends State<MobilePortrait> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
            colorFilter: ColorFilter.mode(Colors.green, BlendMode.dstATop),
            image: AssetImage("assets/images/farm.jpg"),
            fit: BoxFit.cover),
      ),
      child: ListView(
        shrinkWrap: true,
        key: UniqueKey(),
        physics: const BouncingScrollPhysics(),
        children: [
          Flexible(
            child: Container(
              height: widget.height,
              color: Theme.of(context).backgroundColor.withOpacity(0.93),
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              child: Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: RichText(
                                  text: TextSpan(
                                      text:
                                          "Discover, buy and sell quality Agro-products and services.",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline3!
                                          .copyWith(
                                              fontSize: 34,
                                              fontWeight: FontWeight.w800),
                                      children: [
                                    TextSpan(
                                        text:
                                            "\n\nAgriMart is the world's and largest digital Argo-product marketplace.",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20),
                                        children: [
                                          TextSpan(
                                            text:
                                                "\n\nYou need an ethereum wallet to use AgriMart\n",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3!
                                                .copyWith(
                                                  fontSize: 18,
                                                ),
                                          )
                                        ])
                                  ]))),
                          const SizedBox(
                            height: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            child: Flexible(
                              child: CustomElevatedButton(
                                buttonBackgroundColor: Colors.blue.shade500,
                                buttonOutlineColor: Colors.blue.shade400,
                                title: "Connect to Wallet",
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                          child: Container(
                                            width: 500,
                                            height: 350,
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                borderRadius:
                                                    BorderRadius.circular(40)),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20.0,
                                                          right: 10,
                                                          left: 10),
                                                  child: Text(
                                                    "Connect with one of our available wallets",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline3!
                                                        .copyWith(fontSize: 20),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                      .symmetric(vertical: 10),
                                                  child: ListTile(
                                                    hoverColor:
                                                        Colors.teal.shade500,
                                                    leading: const Icon(Icons
                                                        .wallet_membership),
                                                    title:
                                                        const Text("MetaMask"),
                                                    onTap: () {
                                                      Navigator.pop(context);

                                                      GoRouter.of(context)
                                                          .goNamed("home");
                                                      Provider.of<AppStateManager>(
                                                              context,
                                                              listen: false)
                                                          .setIsLoggedIn(true);
                                                    },
                                                  ),
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
                                },
                                elevation: 10,
                                onHover: (value) {},
                                height: 45,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 300,
                          )
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: Container(
                      height: widget.height,
                      alignment: Alignment.center,
                      color: Colors.teal.shade700.withOpacity(0.5),
                      child: LottieBuilder.asset(
                        "assets/lottie/two-factor-authentication.json",
                        width: widget.width / 0.5,
                        height: widget.height,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 500,
              decoration: BoxDecoration(color: Colors.blue.withOpacity(0.93)),
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(child: Text("Footer")),
            ),
          )
        ],
      ),
    );
  }
}
