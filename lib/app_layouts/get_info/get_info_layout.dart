import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:job1/app_layouts/login/login_layouts/shop_login_layout.dart';
import 'package:job1/app_layouts/login/login_layouts/user_login_layout.dart';
import 'package:job1/app_layouts/register/shop_register_layout.dart';
import 'package:job1/app_layouts/register/user_register_layout.dart';
import 'package:job1/modules_helper/modules.dart';

class GetInformationScreen extends StatefulWidget {
  const GetInformationScreen({Key? key}) : super(key: key);

  @override
  State<GetInformationScreen> createState() => _GetInformationScreenState();
}

class _GetInformationScreenState extends State<GetInformationScreen> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow[700],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.yellow[800],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 280,
            width: double.infinity,
            color: Colors.yellow[700],
            child: Image.asset(
              "asset/Untitled.png",
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                    alignment: AlignmentDirectional.center,
                    height: 100,
                    width: 320,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              navigateAndBack(context,
                                  goToScreen: UserAccountRegister());
                            },
                            child: Container(
                              alignment: AlignmentDirectional.centerEnd,
                              decoration: BoxDecoration(
                                color: Colors.yellow[700],
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50.0),
                                  topLeft: Radius.circular(50.0),
                                ),
                              ),
                              child: Image.asset(
                                "asset/most5tdm.png",
                                width: 120,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              navigateAndBack(context,
                                  goToScreen: ShopAccountRegister());
                            },
                            child: Container(
                              alignment: AlignmentDirectional.center,
                              decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              child: Image.asset(
                                "asset/m7l.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 100,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text(
                      "تسجيل الدخول",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      isPressed = !isPressed;
                    });
                  },
                ),
                isPressed
                    ? Container(
                        alignment: AlignmentDirectional.center,
                        height: 80,
                        width: 220,
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  navigateAndBack(context,
                                      goToScreen: UserLoginScreen());
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  color: Colors.yellow[700],
                                  child: Text(
                                    "حساب مستخدم",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  navigateAndBack(context,
                                      goToScreen: ShopLoginScreen());
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  color: Colors.red[900],
                                  child: Text(
                                    "حساب محل",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                    : SizedBox(
                        height: 1,
                      ),
                /*
                SizedBox(
                  height: 40,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "نسيت كلمة المرور",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),*/
              ],
            ),
          ),
        ],
      ),
    );
  }
}
