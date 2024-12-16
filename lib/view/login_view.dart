import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecurePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
            decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.alternate_email)),
            onFieldSubmitted: (value) {
              Utils.fieldFocusChange(
                  context, emailFocusNode, passwordFocusNode);
              // FocusScope.of(context).requestFocus(passwordFocusNode);
            },
          ),
          ValueListenableBuilder(
              valueListenable: _obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obsecurePassword.value,
                  keyboardType: TextInputType.emailAddress,
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: Icon(_obsecurePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off))),
                  onFieldSubmitted: (value) {
                    // FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                );
              }),
          InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.navbar);
                // Utils.snackBar("message", context);
                // Utils.flushBarErrorMessage("message", context);
                // Utils.toastMessage("No internet connection");
                // Navigator.pushNamed(context, RoutesName.home);
              },
              child: Text("route")),
          SizedBox(
            height: 30,
          ),
          RoundButton(
              title: "Login",
              // loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.snackBar("Please enter email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.snackBar("Please enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.snackBar("Please enter 6 digit password", context);
                } else {
                  Map data = {
                    "email": _emailController.text.toString(),
                    "password": _passwordController.text.toString()
                  };
                  print(data);
                  // authViewModel.loginApi(data, context);
                  print("Api Hit");
                }
              })
        ],
      )),
    );
  }
}
