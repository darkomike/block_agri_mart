import 'package:block_agri_mart/application/components/components.dart';
import 'package:block_agri_mart/application/constants/assets_constant.dart';
import 'package:block_agri_mart/application/state/app.dart';
import 'package:block_agri_mart/presentation/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'dart:developer' as developer;

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexHomepageTab = 1;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  late ScrollController _scrollHomeController;

  bool _showFAB = false;

  String _categorySelectedIs = "All";

  @override
  void initState() {
    _scrollHomeController = ScrollController()
      ..addListener(() {
        setState(() {
          _showFAB = _scrollHomeController.offset > 100 ? true : false;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollHomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: ColorConstants.scaffoldBackgroundColorL,
          key: scaffoldKey,
          floatingActionButton: Visibility(
            visible: _showFAB,
            child: FloatingActionButton(
              onPressed: () {
                _scrollHomeController.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.ease);
              },
              backgroundColor: const Color.fromARGB(255, 41, 163, 151),
              child: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.arrow_back,
                  )),
            ),
          ),
          drawer: const AppDrawer(),
          body: LayoutBuilder(
            builder: ((context, constraints) {
              return Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor),
                  child: Stack(
                    children: [
                      ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        key: UniqueKey(),
                        children: [
                          HomepageHeader(
                            width: constraints.maxWidth,
                          ),
                          const ProductCategories(),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                  // color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: Theme.of(context).iconTheme.size,
                                  ),
                                  onPressed: () {
                                    scaffoldKey.currentState!.openDrawer();
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  margin: const EdgeInsets.only(left: 10),
                                  decoration: const BoxDecoration(
                                      // color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: 0,
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: const Text("10",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12)),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.notifications,
                                            size: Theme.of(context)
                                                .iconTheme
                                                .size,
                                          ),
                                          onPressed: () {
                                            context.goNamed('notifications');
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ));
            }),
          )),
    );
  }
}

class HomepageHeader extends StatelessWidget {
  const HomepageHeader({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 60),
        decoration:
            BoxDecoration(color: ColorConstants.scaffoldBackgroundColorL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeUser(),
            TrendingProducts(
              width: width,
            ),
          ],
        ));
  }
}

class WelcomeUser extends StatelessWidget {
  const WelcomeUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          ProfileAvatar(),
          WelcomeProfile(),
          Spacer(),
          LottieBuilder.asset(
            AssetsConstant.homepageLottie,
            width: 50,
            height: 50,
          ),
        ],
      ),
    );
  }
}

class WelcomeProfile extends StatelessWidget {
  const WelcomeProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: RichText(
          text: TextSpan(
              text: "Welcome Buddy!",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(fontSize: 14, fontWeight: FontWeight.w800),
              children: [
            TextSpan(
                text: "\n0x07654....6889879",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(fontSize: 12, color: Colors.teal),
                children: [])
          ])),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'profile_pic',
      child: GestureDetector(
        onTap: () {
          context.goNamed('profile');
        },
        child: Container(
            height: 50,
            width: 50,
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                backgroundImage: AssetImage(AssetsConstant.profilePic),
              ),
            )),
      ),
    );
  }
}

class ProductCategories extends StatelessWidget {
  const ProductCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 900,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: Row(
                children: [
                  Text(
                    "Categories:",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    appStateManager.categorySelectedIs,
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 20, color: Colors.teal),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  CategorySelectionCard(
                    name: 'All',
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeCategorySelected('All');
                    },
                    icon: SizedBox(
                        child: SvgPicture.asset(
                      AssetsConstant.allSvg,
                      height: 5,
                      width: 5,
                    )),
                  ),
                  CategorySelectionCard(
                    name: 'Food',
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeCategorySelected('Food');
                    },
                    icon: SizedBox(
                        child: SvgPicture.asset(
                      AssetsConstant.foodSvg,
                      height: 5,
                      width: 5,
                    )),
                  ),
                  CategorySelectionCard(
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeCategorySelected('Machinery');
                    },
                    name: 'Machinery',
                    icon: SizedBox(
                        child: SvgPicture.asset(
                      AssetsConstant.machinerySvg,
                      height: 5,
                      width: 5,
                    )),
                  ),
                  CategorySelectionCard(
                    name: 'Animals',
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeCategorySelected('Animals');
                    },
                    icon: SizedBox(
                        child: SvgPicture.asset(
                      AssetsConstant.animalsSvg,
                      height: 5,
                      width: 5,
                    )),
                  ),
                  CategorySelectionCard(
                    name: 'Services',
                    onTap: () {
                      Provider.of<AppStateManager>(context, listen: false)
                          .changeCategorySelected('Services');
                    },
                    icon: SizedBox(
                        child: SvgPicture.asset(
                      AssetsConstant.servicesSvg,
                      height: 5,
                      width: 5,
                    )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 400,
              child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 3,
                  children: [
                    Container(
                    
                      height: 800,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            height: 300,
                            width: 100,
                            child: Column(children: [
                              Container(
                                height: 100,
                                color: Colors.red,
                              ),
                              Container(
                                height: 100,
                                color: Colors.green,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 400,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            
                            child: Column(
                              
                              children: [
                              Container(
                                height: 100,
                                color: Colors.red,
                              ),
                              Container(
                                height: 100,
                                color: Colors.green,
                              ),
                            ]),
                          ),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}

class CategorySelectionCard extends StatelessWidget {
  const CategorySelectionCard(
      {Key? key, required this.name, required this.icon, this.onTap})
      : super(key: key);

  final String name;
  final Widget icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 1500),
        height: 80,
        decoration: BoxDecoration(
            color: appStateManager.categorySelectedIs == name
                ? Colors.teal
                : Colors.teal.shade100,
            borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 27,
                width: 27,
                // margin: const EdgeInsets.(left: 10),
                decoration: const BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrendingProducts extends StatelessWidget {
  const TrendingProducts({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 22, top: 20, bottom: 10),
            child: Text(
              "Trending Products",
              style:
                  Theme.of(context).textTheme.headline1!.copyWith(fontSize: 25),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            height: 200,
            child: PageView(
              scrollDirection: Axis.horizontal,
              key: UniqueKey(),
              physics: const ClampingScrollPhysics(),
              children: [
                TrendingProductCard(width: width),
                TrendingProductCard(width: width),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingProductCard extends StatelessWidget {
  const TrendingProductCard({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: width,
      child: Card(
        elevation: 5,
        shadowColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(fit: StackFit.expand, children: [
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                    image: AssetImage(
                      AssetsConstant.bgPic,
                    )),
                borderRadius: BorderRadius.circular(20)),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  // ignore: prefer_const_constructors
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.teal.withOpacity(0.1),
                        Colors.teal.withOpacity(0.2),
                        Colors.teal.withOpacity(0.3),
                        Colors.teal.withOpacity(0.4),
                        Colors.teal.withOpacity(0.5),
                        Colors.teal.withOpacity(0.6),
                        Colors.teal.withOpacity(0.7),
                        Colors.teal.withOpacity(0.8),
                        Colors.teal.withOpacity(0.9),
                        Colors.teal
                      ]),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              padding: const EdgeInsets.only(left: 5, top: 10),
              child: Row(
                children: [
                  Container(
                      height: 60,
                      width: 60,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: const BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          backgroundImage:
                              AssetImage(AssetsConstant.profilePic),
                        ),
                      )),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: RichText(
                        text: TextSpan(
                            text: "Farmland ",
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                            children: [
                          TextSpan(
                              text: "\n0x0765488768...889879",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3!
                                  .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                              children: [
                                TextSpan(
                                  text: "\n3.84ETH",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                )
                              ])
                        ])),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
