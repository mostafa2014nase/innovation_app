import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/register/register_bloc/rigester_states.dart';
import 'package:job1/app_level_helpers/constants/endpoints.dart';
import 'package:job1/app_level_helpers/dio_helper/dio.dart';

class RegisterCubitClass extends Cubit<RegisterStates> {
  RegisterCubitClass() : super(RegisterInitialState());

  static RegisterCubitClass get(context) => BlocProvider.of(context);

  List<TextEditingController> userEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  List<String> userHintWordsList = [
    "أسم المستخدم",
    "الموبايل",
    "العنوان",
    "كلمة المرور",
  ];
  String firstNameHint = "الأسم الأول";
  String lastNameHint =  "الأسم الأخير";

  List userKeyBoardtypeList = [
    TextInputType.text,
    TextInputType.number,
    TextInputType.text,
    TextInputType.visiblePassword,
  ];


  List<TextEditingController> shopEditingControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  TextEditingController shopFirstNameController = TextEditingController();
  TextEditingController shopLastNameController = TextEditingController();

  List<String> shopHintWordsList = [
    "الموبايل",
    "أسم المستخدم",
    "كلمة المرور",
    "الإيميل",
    "إسم الشركة فى السجل التجارى",
    "رقم السجل التجارى",
    "الدولة",
    "المحافظة",
    "المنطقة",
    "إختر فئات المنتجات",
  ];
  String shopFirstNameHint = "الأسم الأول";
  String shopLastNameHint =  "الأسم الأخير";

  List shopKeyBoardtypeList = [
    TextInputType.text,
    TextInputType.number,
    TextInputType.visiblePassword,
    TextInputType.emailAddress,
  ];

  bool shopIsPressed = false;

  void changeIcon() {
    shopIsPressed = !shopIsPressed;
    emit(RegisterChangeShopIconState());
  }

  bool userIsPressed = false;

  void changeIconUser() {
    userIsPressed = !userIsPressed;
    emit(RegisterChangeUserIconState());
  }

  void shopRegister({
    required String firstName,
    required String lastName ,
    required String mobile,
    required String password,
    required String email,
    required String companyName,
  }) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(url: ShopRegisterEndPoint, data: {
      "f_name": firstName,
      "l_name": lastName,
      "mobile": mobile,
      "password": password,
      "email": email,
      "company_name": companyName,
    }).then((value) {
      print(value.data);
      emit(ShopRegisterSuccessState());
    }).catchError((error) {
      print("theeeeeeeeeeeere is error : ${error.toString()}");
      emit(ShopRegisterErrorState(error));
    });
  }

  void userRegister({
    required String firstName,
    required String lastName ,
    required String mobile,
    required String password,
    required String userName,
    required String address,
  }) {
    emit(UserRegisterLoadingState());
    DioHelper.postData(url: UserRegisterEndPoint, data: {
      "f_name": firstName,
      "l_name": lastName,
      "mobile": mobile,
      "password": password,
      "user_name": userName,
      "address": address,
    }).then((value) {
      print(value.data.toString());
      emit(UserRegisterSuccessState());
    }).catchError((error) {
      print("theeeeeeeeeeeere is error : ${error.toString()}");
      emit(UserRegisterErrorState(error));
    });
  }

//UserModel? model;

/*void userCreate({
    required String name,
    required String email,
    required String phone,
    required String uId,
  }) {
    model = UserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      image:
          "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png",
    );
    FirebaseFirestore.instance
        .collection("users")
        .doc(uId)
        .set(model!.toMap())
        .then((value) {
      emit(UserCreateSuccessState());
    }).catchError((error) {
      emit(UserCreateErrorState(error));
    });
  }*/
}
