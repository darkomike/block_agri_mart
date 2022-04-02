import 'package:block_agri_mart/theme/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../components/components.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String name = "Explore";
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    print("Height: $height");
    print("Width: $width");
    return Scaffold(

      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          print("Height in layout: ${constraints.maxHeight}");
          print("Width in layout: ${constraints.maxWidth}");

            return Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/farm.jpg"),
                      fit: BoxFit.cover)),
              child: ListView(
                shrinkWrap: true,
                key: UniqueKey(),
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    
                    color: Theme.of(context).backgroundColor.withOpacity(0.97),
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: [
                        Container(
                          color: Colors.red,
                          padding: const EdgeInsets.only(
                              left: 200, top: 100),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width:600,
                                padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "Discover, buy and sell quality Agro-products and services.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w800),
                                ),
                              ),
                              Container(
                              width: 450,
                               padding: const EdgeInsets.only(top: 30),
                                child: Text(
                                  "AgriMart is the world's and largest digital Argo-product marketplace.",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20),
                                ),
                              ), 
                              Container(
                                color: Colors.blue,
                                margin: const EdgeInsets.only(top: 60), 
                                alignment: Alignment.centerLeft,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomButton(
                                          buttonBackgroundColor:
                                              Colors.teal.shade600,
                                          buttonOutlineColor:
                                              Colors.teal.shade600,
                                          title: "Explore",
                                          onPressed: () {},
                                          elevation: 5, 
                                          onHover: (value) {}, 
                                          height: 45,
                                          width: 100),

                                      CustomButton(
                                          buttonOutlineColor:
                                              Colors.teal.shade700,
                                          title: "Connect",
                                          elevation: 5,
                                          onHover: (value){},
                                          onPressed: (){
                              
                                          },
                                          height: 45,
                                          width: 120),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child:  LottieBuilder.asset("assets/lottie/two-factor-authentication.json"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0),
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).backgroundColor.withOpacity(0.97),
                    ),
                    height: 500,
                    child: const Text("Main"),
                    alignment: Alignment.center,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal.shade700.withOpacity(0.98),
                    ),
                    height: 400,
                    child: GridView.count(
                      physics: const ClampingScrollPhysics(),
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                      crossAxisCount: 1,
                      children: const [
                        Text("Footer"),
                        Text("Footer"),
                      ],
                    ),
                    alignment: Alignment.center,
                  ),
                  Container(
                      alignment: Alignment.center,
                      color: Colors.black.withOpacity(0.85),
                      child: const Text(
                        "Copyright @ 2022",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            );



        },
      ),
    );
  }
}
