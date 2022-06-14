import 'package:block_agri_mart/application/components/custom_list_tile.dart';
import 'package:block_agri_mart/application/constants/assets_constant.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String tabName = 'My Assets';

  late PageController _pageController;

  late ScrollController _mainScrollController;
  late ScrollController _tabViewScrollController;

  @override
  void initState() {
    _pageController = PageController(keepPage: true, initialPage: 0);
    _mainScrollController = ScrollController()
      ..addListener(() {
        developer.log(
          "Main View Offset ${_mainScrollController.offset}",
        );
      });
    _tabViewScrollController = ScrollController()
      ..addListener(() {
        developer.log(
          "Tab View Position ${_tabViewScrollController.position}",
        );

        _mainScrollController.animateTo(_tabViewScrollController.offset,
            duration: const Duration(seconds: 2), curve: Curves.ease);
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {}),
          backgroundColor: Colors.white,
          body: LayoutBuilder(builder: (context, constraints) {
            return Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: ListView(
                controller: _mainScrollController,
                key: UniqueKey(),
                children: [
                  Container(
                    height: 220,
                    color: Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    child: Stack(
                      key: UniqueKey(),
                      children: [
                        Container(
                          height: 160,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(AssetsConstant.bgPic))),
                        ),
                        Positioned(
                          right: constraints.maxWidth / 2.8,
                          top: 110,
                          child: Hero(
                            tag: 'profile_pic',
                            transitionOnUserGestures: true,
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: CircleAvatar(
                                    maxRadius: 100,
                                    backgroundImage:
                                        AssetImage(AssetsConstant.profilePic)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const ProfileInfo(),
                  const CustomTabView(
                    isSelected: 2,
                  ),
                  SizedBox(
                    height: constraints.maxHeight / 1.2,
                    child: PageView(
                      controller: _pageController,
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: ListView.builder(
                                controller: _tabViewScrollController,
                                itemCount: 10,
                                key: UniqueKey(),
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return const CustomListTile(title: 'Assets');
                                }))
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Text(
          'Kwaku Manu Governor',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Chip(
          elevation: 1,
          backgroundColor: Colors.green,
          label: Text(
            '0x0809820980928092809280928082',
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(fontSize: 12, color: Colors.white),
          ),
        ),
        Text(
          'Joined April 2022',
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(fontSize: 10, color: Colors.red),
        )
      ]),
    );
  }
}

class CustomTabView extends StatelessWidget {
  const CustomTabView({
    Key? key,
    required this.isSelected,
  }) : super(key: key);

  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        children: [
          CustomTabBar(
            tabName: "My Assets",
            icon: const Icon(Icons.star),
            width: 150,
            counter: 10,
            isSelected: isSelected == 1 ? Colors.blue : Colors.transparent,
          ),
          CustomTabBar(
            tabName: "Created",
            icon: const Icon(Icons.add_box),
            width: 150,
            counter: 45,
            isSelected: isSelected == 2 ? Colors.blue : Colors.transparent,
          ),
          CustomTabBar(
            tabName: "Favorites",
            icon: Icon(Icons.favorite),
            isSelected: isSelected == 3 ? Colors.blue : Colors.transparent,
            width: 150,
            counter: 20,
          ),
        ],
      ),
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.tabName,
      this.onTap,
      required this.icon,
      required this.width,
      required this.isSelected,
      required this.counter})
      : super(key: key);

  final String tabName;
  final void Function()? onTap;
  final Widget icon;
  final int counter;
  final double width;
  final Color isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: width,
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  icon,
                  const SizedBox(
                    width: 3,
                  ),
                  Text(tabName),
                  CircleAvatar(
                      maxRadius: 10,
                      child: Text(
                        '$counter',
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            AnimatedContainer(
              alignment: Alignment.center,
              height: 2,
              duration: const Duration(milliseconds: 900),
              width: 150,
              color: isSelected,
            )
          ],
        ),
      ),
    );
  }
}
