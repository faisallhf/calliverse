import 'package:calliverse/router/router_config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NavigationHandler());
}

class NavigationHandler extends StatefulWidget {
  const NavigationHandler({super.key});
  @override
  _NavigationHandlerState createState() => _NavigationHandlerState();
}

class _NavigationHandlerState extends State<NavigationHandler> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData.dark(),
        routerConfig: CalliverseRouter().router,
      ),
    );
  }
}
