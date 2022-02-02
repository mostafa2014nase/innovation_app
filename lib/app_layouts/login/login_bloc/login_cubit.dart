import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/login/login_bloc/login_states.dart';
import 'package:job1/app_level_helpers/constants/endpoints.dart';
import 'package:job1/app_level_helpers/dio_helper/dio.dart';

class LoginCubitClass extends Cubit<LoginStates> {
  LoginCubitClass() : super(LoginInitialState());

  static LoginCubitClass get(context) => BlocProvider.of(context);

  TextEditingController shopEmailController = TextEditingController();
  TextEditingController shopPasswordController = TextEditingController();
  String shopEmailHintWords = "الإيميل";
  String shopPasswordHintWords = "كلمة المرور";
  var shopEmailKeyboard = TextInputType.emailAddress;
  var shopPasswordKeyboard = TextInputType.visiblePassword;

  TextEditingController userMobileNumberController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  String userMobileNumberHintWords = "رقم الموبايل";
  String userPasswordHintWords = "كلمة المرور";
  var userMobileKeyboard = TextInputType.number;
  var userPasswordKeyboard = TextInputType.visiblePassword;

  void shopLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: ShopLoginEndPoint, data: {
      "email": email,
      "password": password,
    }).then((value) {
      emit(ShopLoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error));
    });
  }

  void userLogin({
    required String mobile,
    required String password,
  }) {
    emit(UserLoginLoadingState());
    DioHelper.postData(url: UserLoginEndPoint, data: {
      "mobile": mobile,
      "password": password,
    }).then((value) {
      emit(UserLoginSuccessState());
    }).catchError((error) {
      print("theeeeeeeeere is error heeeeeree : ${error.toString()}");
      emit(UserLoginErrorState(error));
    });
  }
}
