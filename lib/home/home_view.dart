import 'package:flutter/material.dart';
import 'package:flutter_auth_manager/core/auth_manager.dart';
import 'package:flutter_auth_manager/core/cache_manager.dart';
import 'package:flutter_auth_manager/home/model/user_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with CacheManager {
  String token = '';

  late UserModel? userModel;

  Future<void> getTokenCache() async {
    token = await getToken() ?? '';
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    userModel = context.read<AuthenticationManager>().model;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(token),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userModel?.imageUrl ?? ''),
              radius: 50,
            ),
            Text(
              userModel?.name ?? '',
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
