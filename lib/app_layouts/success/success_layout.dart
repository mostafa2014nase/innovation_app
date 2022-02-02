import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/register/register_bloc/rigester_cubit.dart';
import 'package:job1/app_layouts/register/register_bloc/rigester_states.dart';

class ScuccessRegisteration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubitClass, RegisterStates>(
      listener: (context, state) {},
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
                              "asset/success2.png",
                              width: 100,
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
                                vertical: 40.0, horizontal: 20),
                            height: 500.0,
                            width: 340,
                            color: Colors.white,
                            child: Image.asset(
                              "asset/success3.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )
                    ],
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
