import 'package:flutter/material.dart';
import 'package:flutter_auth_manager/login/login_resources.dart';
import './login_view_model.dart';

class LoginView extends LoginViewModel with LoginResources {
  final EdgeInsets paddingLow = EdgeInsets.all(8);
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: paddingLow,
        child: Center(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: buildWrapFormBody(),
          ),
        ),
      ),
    );
  }

  Wrap buildWrapFormBody() {
    return Wrap(
      runSpacing: 10,
      alignment: WrapAlignment.end,
      children: [
        TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder(), labelText: emailText),
          controller: emailController,
        ),
        TextFormField(
          decoration: InputDecoration(border: OutlineInputBorder(), labelText: passwordText),
          controller: passwordController,
        ),
        FloatingActionButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {
              fetchUserLogin(emailController.text, passwordController.text);
            }
          },
          child: Icon(Icons.check),
        )
      ],
    );
  }
}
