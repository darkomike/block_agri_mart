import 'dart:async';
import 'package:block_agri_mart/application/state/app.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../application/components/components.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  String? _selectedTypeSelected;

  List<String> userTypes = ["Seller", "Buyer"];
  TextEditingController? _metaMuskIdController;

  @override
  void initState() {
    _selectedTypeSelected = "Seller";
    _metaMuskIdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _metaMuskIdController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Is Logged In: ${appStateManager.loggedIn}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth;
          final height = constraints.maxHeight;
          print("Height in layout: ${constraints.maxHeight}");
          print("Width in layout: ${constraints.maxWidth}");
          return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF02AAB0), Color(0xFF00CDAC)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(
                  "assets/lottie/two-factor-authentication.json",
                  width: width / 1.5,
                  height: height / 2.5,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Discover, buy and sell quality Agro-products and services.",
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Text(
                      "\n\nAgriMart is the world's and largest digital Argo-product marketplace.",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 15),
                    )),
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                    buttonBackgroundColor: Colors.blueGrey.shade700,
                    buttonOutlineColor: Colors.teal.shade500,
                    title: "Connect to Wallet",
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                child: StatefulBuilder(
                                  builder: (context, setState) {
                                    return Container(
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.8),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Connect Wallet ",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline3!
                                                  .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  hintText:
                                                      'Provide your Meta Musk ID',
                                                  suffix: IconButton(
                                                      onPressed: () {
                                                        _metaMuskIdController!
                                                            .clear();
                                                      },
                                                      icon: const Icon(
                                                          Icons.clear))),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                SizedBox(
                                                  child: Text(
                                                    "Connect as : ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                  ),
                                                ),
                                                Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                                  height: 35,
                                                  width: 100,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.green.shade300,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        width: .5,
                                                        color: Colors
                                                            .green.shade400),
                                                  ),
                                                  child: DropdownButton<String>(
                                                      underline: Container(),
                                                      value:
                                                          _selectedTypeSelected,
                                                      items: userTypes
                                                          .map((String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          child: Text(value),
                                                          value: value,
                                                        );
                                                      }).toList(),
                                                      onChanged: (value) {
                                                        setState(() =>
                                                            _selectedTypeSelected =
                                                                value);
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),

                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: TextButton(onPressed: (){}, child: Row(children: const [
                                              Text("Connect"), Icon(Icons.connect_without_contact_sharp)
                                            ],)),
                                          ),

                                          Center(
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("BACK"),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ));
                          });
                    },
                    elevation: 5,
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
    );
  }
}
