import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/router/router_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: NavigationHandler(),
    ),
  );
}

class NavigationHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            routerConfig: CalliverseRouter().router,
          );
        },
      ),
    );
  }
}
