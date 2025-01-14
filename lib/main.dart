import 'dart:io';

import 'package:calliverse/pages/ThemeProvider.dart';
import 'package:calliverse/router/router_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCVPq9DWzgY4gMpvVOYYwJnuGbbJ1VYhAY',
     appId: '1:469565641935:android:3462b7afe85af1a18593ba',
      messagingSenderId: '469565641935',
       projectId: 'calliverse-2b11c'
       )):await Firebase.initializeApp();
    

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
