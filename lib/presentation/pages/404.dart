import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page404 extends StatelessWidget {
  const Page404({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextButton(
                onPressed: () {
                  context.goNamed("home");
                },
                
                child: Text(
                  "Go to Homepage",
                  style:
                      Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
                )),
                 Padding(
                   padding: const EdgeInsets.all(30.0),
                   child: Center(
              
                child: Text(
                    
                    "Oops Page Not Found",
                    style:
                        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 50),
                )),
                 ),
          ],
        ),
      ),
    );
  }
}
