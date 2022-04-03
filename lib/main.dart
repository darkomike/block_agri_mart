import 'package:block_agri_mart/application/application.dart';
import 'package:block_agri_mart/application/state/app.dart';
import 'package:provider/provider.dart';
import 'presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appStateManager),
      ],
      child: Consumer<AppStateManager>(builder: ((context, appState, child) {
        ThemeData theme;
        if (appState.getIsDarkModeOn) {
          theme = AppTheme.dark();
        } else {
         theme = AppTheme.light();
        }
        return MaterialApp.router(
          routeInformationParser: appRouter.routeInformationParser,
          routerDelegate: appRouter.routerDelegate,
          title: 'AgriMart',
          debugShowCheckedModeBanner: false,
          theme: theme,
          
          // darkTheme: AppTheme.dark(),
        );
      })),
    );
  }
}
