import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/state/state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "AgriMart",
            style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "Quicksand"),
          ),
        ),
        body: LayoutBuilder(
          builder: ((context, constraints) {
            return Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Row(
                key: UniqueKey(),
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            ListTile(
                                focusColor: Colors.teal.shade500,
                                title: Text(
                                  "Dashboard",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 18),
                                ),
                                onTap: () {}),
                            ListTile(
                                hoverColor: Colors.teal.shade500,
                                title: Text(
                                  "My Assets",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 18),
                                ),
                                onTap: () {
                                  print("My Assets");
                                }),
                           
                            SwitchListTile(

                                hoverColor: Colors.teal.shade500,
                                title: Text(
                                  "Dark Mode ${appStateManager.getIsDarkModeOn ? "ON" : "OFF"}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3!
                                      .copyWith(fontSize: 18),
                                ),
                                value: Provider.of<AppStateManager>(context,
                                        listen: false)
                                    .getIsDarkModeOn,
                                onChanged: (bool value) {
                                  Provider.of<AppStateManager>(context,
                                          listen: false)
                                      .setIsDarkModeOn(value);
                                }),
                          ],
                        )),
                  ),
                  Flexible(
                    flex: 6,
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        key: UniqueKey(),
                        children: [
                          Container(
                              decoration:
                                  const BoxDecoration(color: Colors.red),
                              height: 200,
                              child: Center(
                                  child: Text(
                                "HEADER",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 50),
                              ))),
                          Container(
                              height: 600,
                              decoration:
                                  BoxDecoration(color: Colors.amber.shade300),
                              child: Center(
                                  child: Text(
                                "BODY",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 50),
                              ))),
                          Container(
                              height: 400,
                              decoration:
                                  const BoxDecoration(color: Colors.green),
                              child: Center(
                                  child: Text(
                                "FOOTER",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .copyWith(fontSize: 50),
                              ))),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
        ));
  }
}
