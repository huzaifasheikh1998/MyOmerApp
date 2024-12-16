import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/res/color.dart';
import 'package:mvvm/res/components/text.dart';
import 'package:mvvm/res/images.dart';
import 'package:mvvm/res/size.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/signIn_view_model.dart';
import 'package:provider/provider.dart';

class SigninView extends StatelessWidget {
  SigninView({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Sized sized = Sized(context);
    // final signInViewModel = Provider.of(con)
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        color: AppColors.thirdColor,
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image.asset(Images.spiritual,color:  AppColors.dayWeekColorList[4],
                  // height: sized.height(0.2),),
                  // SizedBox(
                  //   height: sized.height(0.018),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Images.logoTransparent,
                        height: sized.height(0.07),
                        color: AppColors.secondaryColor,
                      ),
                      Content(
                        data: "Register Your Account",
                        size: sized.height(0.025),
                        weight: FontWeight.w600,
                        color: AppColors.primaryColor,
                        alignment: TextAlign.center,
                      ),
                    ],
                  ),
                  //   SizedBox(
                  //   height: sized.height(0.02),
                  // ),
                  SizedBox(
                    height: sized.height(0.02),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                            RegExp(r'\s')), // Deny whitespace/space
                        // FilteringTextInputFormatter.allow(RegExp(
                        //     r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')), // Allow valid email format
                      ],
                      style: TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: AppColors.lightGrey,
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(67, 0, 0, 0)),
                          contentPadding: EdgeInsets.symmetric(horizontal: 30),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: sized.height(0.03),
                  ),
                  Content(
                    data:
                        "Recieve reminders and snippets\nof the daily ME365 exercise\ndirectly in your inbox.",
                    size: sized.height(0.02),
                    weight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    alignment: TextAlign.center,
                  ),

                  SizedBox(
                    height: sized.height(0.3),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 30, bottom: 30, left: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Content(
                      //   data: "Skip",
                      //   size: sized.height(0.024),
                      //   color: AppColors.primaryColor,
                      //   weight: FontWeight.w400,
                      // ),
                      Consumer<SignInViewModel>(
                          builder: (context, value, child) {
                        return GestureDetector(
                          onTap: value.loading
                              ? null
                              : () {
                                  print("Onpresses");
                                  if (emailController.text.isEmpty) {
                                    Utils.snackBar("Enter email", context);
                                  } else if (emailController.text.length < 7 ||
                                      !emailController.text.contains("@")) {
                                    Utils.snackBar(
                                        "Enter valid email", context);
                                  } else {
                                    Map body = {
                                      "email": emailController.text.toString()
                                    };
                                    print(body);
                                    value.signInApi(body, context);
                                  }
                                  // Navigator.pushNamed(context, RoutesName.navbar);
                                },
                          child: Container(
                              child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: sized.height(0.05),
                            color: value.loading
                                ? AppColors.lightGrey2
                                : AppColors.primaryColor,
                          )),
                        );
                      }),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
