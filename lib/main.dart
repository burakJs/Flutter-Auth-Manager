import 'package:flutter/material.dart';
import 'package:flutter_auth_manager/core/auth_manager.dart';
import 'package:flutter_auth_manager/folder/splash_view.dart';
import 'package:flutter_auth_manager/login/login.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<AuthenticationManager>(
            create: (context) => AuthenticationManager(context: context),
          )
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: SplashView(),
    );
  }
}
