import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/login/login_bloc/login_cubit.dart';
import 'package:job1/app_layouts/success/success_layout.dart';
import 'package:job1/modules_helper/modules.dart';

import '../login_bloc/login_states.dart';

class UserLoginScreen extends StatelessWidget {
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubitClass.get(context);
    return BlocConsumer<LoginCubitClass, LoginStates>(
      listener: (context, state) {
        print(state);
        if (state is UserLoginSuccessState) {
          navigateAndBack(context, goToScreen: ScuccessRegisteration());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow[700],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                  ),
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          color: Colors.yellow[700],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    "asset/user.png",
                                    width: 200,
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Text(
                                    "بيانات تسجيل الدخول",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.menu,
                                color: Colors.black,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 30.0, horizontal: 20),
                              width: 340,
                              color: Colors.white,
                              child: Form(
                                key: form_key,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      make_def_buttons_for_rigesteration(
                                        keyboard_type: cubit.userMobileKeyboard,
                                        controller:
                                            cubit.userMobileNumberController,
                                        lableword:
                                            cubit.userMobileNumberHintWords,
                                        validate_fun: (value) {
                                          if (value!.isEmpty)
                                            return "  أكمل البيانات";
                                        },
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      make_def_buttons_for_rigesteration(
                                        keyboard_type:
                                            cubit.userPasswordKeyboard,
                                        controller:
                                            cubit.userPasswordController,
                                        lableword: cubit.userPasswordHintWords,
                                        validate_fun: (value) {
                                          if (value!.isEmpty)
                                            return "  أكمل البيانات";
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! UserLoginLoadingState,
                              builder: (context) => InkWell(
                                onTap: () {
                                  if (form_key.currentState!.validate()) {

                                    // call function cubit which handle API posting data

                                    cubit.userLogin(
                                      mobile:
                                          cubit.userMobileNumberController.text,
                                      password:
                                          cubit.userPasswordController.text,
                                    );
                                  }
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 70,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow[700],
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text(
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              fallback: (context) => Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
