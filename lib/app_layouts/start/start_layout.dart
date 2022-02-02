import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:job1/app_layouts/get_info/get_info_layout.dart';
import 'package:job1/app_level_helpers/cash_helper/sharedpref_helper.dart';
import 'package:job1/modules_helper/modules.dart';

class StartAppScreen extends StatelessWidget {
  const StartAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "asset/download.png",
                height: 450,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 35,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        SharedCashHelper.setValue(key: "start", value: true)
                            .then((value) {
                          navigateAndFinish(context, goToScreen: GetInformationScreen());
                        }).catchError((error) {
                          print(error.toString());
                        });
                      },
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        height: 100,
                        width: 250,
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Text(
                          "أبدأ التسوق",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
