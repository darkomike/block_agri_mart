import 'package:block_agri_mart/application/components/custom_list_tile.dart';
import 'package:block_agri_mart/application/constants/assets_constant.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String tabName = 'My Assets';

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(keepPage: true, initialPage: 0);
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
        backgroundColor: Colors.white,
          body: LayoutBuilder(builder: (context, constraints) {
            return Container(
                      color: Colors.white,

              alignment: Alignment.center,
              child: ListView(
                key: UniqueKey(),
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
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
                                  image: AssetImage(AssetsConstant.profile2))),
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
                                        AssetImage(AssetsConstant.profile1)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const ProfileInfo(),
                  const CustomTabView(),
                  SizedBox(
                    height: constraints.maxHeight /1.2,
                    child: PageView(
                      physics: const ClampingScrollPhysics(), 
                      controller: _pageController,
                      // key: UniqueKey(),
                      children: [
                        Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            child: ListView.builder(
                                itemCount: 10,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 90,
      child: SingleChildScrollView(
         scrollDirection: Axis.horizontal, physics: const ClampingScrollPhysics(),
  
        key: UniqueKey(),
       
        child: Row(
         
          children: const [
            CustomTabBar(
              tabName: "My Assets",
              icon: Icon(Icons.favorite),
              width: 150,
              counter: 10,
            ),
            CustomTabBar(
              tabName: "Created",
              icon: Icon(Icons.favorite),
              width: 150,
              counter: 45,
            ),
            CustomTabBar(
              tabName: "Favorites",
              icon: Icon(Icons.favorite),
              width: 150,
              counter: 20,
            ),
          ],
        ),
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
      required this.counter})
      : super(key: key);

  final String tabName;
  final void Function()? onTap;
  final Widget icon;
  final int counter;
  final double width;

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
            Container(
              alignment: Alignment.center,
              height: 2,
              width: 150,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
