import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../state/app.dart';

class Landscape extends StatefulWidget {
  const Landscape({Key? key}) : super(key: key);

  @override
  State<Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                      value:
                          Provider.of<AppStateManager>(context, listen: false)
                              .getIsDarkModeOn,
                      onChanged: (bool value) {
                        Provider.of<AppStateManager>(context, listen: false)
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
                    decoration: const BoxDecoration(color: Colors.red),
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
                    decoration: BoxDecoration(color: Colors.amber.shade300),
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
                    decoration: const BoxDecoration(color: Colors.green),
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
    );
  }
}
