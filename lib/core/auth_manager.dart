import 'package:flutter/material.dart';

import 'package:flutter_auth_manager/core/cache_manager.dart';
import 'package:flutter_auth_manager/home/model/user_model.dart';

class AuthenticationManager with CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  });

  bool isLogin = false;
  UserModel? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }

  void removeAllData() {
    isLogin = false;
    model = null;
  }
}
