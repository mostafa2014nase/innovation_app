import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/register/register_bloc/rigester_cubit.dart';
import 'package:job1/app_layouts/register/register_bloc/rigester_states.dart';
import 'package:job1/app_layouts/success/success_layout.dart';
import 'package:job1/modules_helper/modules.dart';

class UserAccountRegister extends StatelessWidget {
  var form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = RegisterCubitClass.get(context);
    return BlocConsumer<RegisterCubitClass, RegisterStates>(
      listener: (context, state) {
        print(state);
        if (state is UserRegisterSuccessState) {
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
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 150,
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
                              Image.asset(
                                "asset/most5tdm.png",
                                width: 200,
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
                              height: 400.0,
                              width: 340,
                              color: Colors.white,
                              child: Form(
                                key: form_key,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child:
                                                  make_def_buttons_for_rigesteration(
                                                keyboard_type: cubit.userKeyBoardtypeList[0],
                                                controller:
                                                    cubit.firstNameController,
                                                lableword: cubit.firstNameHint,
                                                validate_fun: (value) {
                                                  if (value!.isEmpty)
                                                    return "  أكمل البيانات";
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child:
                                                  make_def_buttons_for_rigesteration(
                                                keyboard_type: cubit.userKeyBoardtypeList[0],
                                                controller:
                                                    cubit.lastNameController,
                                                lableword: cubit.lastNameHint,
                                                validate_fun: (value) {
                                                  if (value!.isEmpty)
                                                    return "  أكمل البيانات";
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Expanded(
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return make_def_buttons_for_rigesteration(
                                              keyboard_type: cubit
                                                  .userKeyBoardtypeList[index],
                                              controller: cubit
                                                      .userEditingControllerList[
                                                  index],
                                              lableword: cubit
                                                  .userHintWordsList[index],
                                              validate_fun: (value) {
                                                if (value!.isEmpty)
                                                  return "  أكمل البيانات";
                                              },
                                            );
                                          },
                                          itemCount: cubit
                                              .userEditingControllerList.length,
                                          separatorBuilder: (context, index) {
                                            return SizedBox(
                                              height: 10,
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "موافق على الشروط والأحكام",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 25,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        cubit.changeIconUser();
                                      },
                                      child: cubit.userIsPressed == false
                                          ? Icon(
                                              Icons
                                                  .check_box_outline_blank_sharp,
                                              size: 40,
                                            )
                                          : Icon(
                                              Icons.check_box_outlined,
                                              size: 40,
                                            )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ConditionalBuilder(
                              condition: state is! UserRegisterLoadingState,
                              builder: (context) => InkWell(
                                onTap: () {
                                  if (form_key.currentState!.validate() &&
                                      cubit.userIsPressed) {
                                    // call function cubit which handle API posting data

                                    cubit.userRegister(
                                      firstName: cubit.firstNameController.text,
                                      lastName: cubit.lastNameController.text,
                                      mobile: cubit
                                          .userEditingControllerList[1].text,
                                      password: cubit
                                          .userEditingControllerList[3].text,
                                      userName: cubit
                                          .userEditingControllerList[0].text,
                                      address: cubit
                                          .userEditingControllerList[2].text,
                                    );
                                  }
                                },
                                child: Container(
                                  alignment: AlignmentDirectional.center,
                                  height: 70,
                                  width: 250,
                                  decoration: BoxDecoration(
                                    color: Colors.red[900],
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Text(
                                    'إنشاء حساب جديد',
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
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
