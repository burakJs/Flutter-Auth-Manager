import 'package:flutter/material.dart';
import 'package:flutter_auth_manager/core/auth_manager.dart';
import 'package:flutter_auth_manager/home/home_view.dart';
import 'package:flutter_auth_manager/home/model/user_model.dart';
import 'package:flutter_auth_manager/login/login.dart';
import 'package:provider/provider.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Future<void> controlToApp() async {
    await readAuthManager.fetchUserLogin();
    if (readAuthManager.isLogin) {
      await Future.delayed(Duration(seconds: 1));
      readAuthManager.model = UserModel.fake();
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
  }

  AuthenticationManager get readAuthManager => context.read<AuthenticationManager>();

  @override
  void initState() {
    super.initState();
    controlToApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
