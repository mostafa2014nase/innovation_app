abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ShopLoginLoadingState extends LoginStates {}

class ShopLoginSuccessState extends LoginStates {}

class ShopLoginErrorState extends LoginStates {
  final dynamic error;

  ShopLoginErrorState(this.error);
}

class UserLoginLoadingState extends LoginStates {}

class UserLoginSuccessState extends LoginStates {}

class UserLoginErrorState extends LoginStates {
  final dynamic error;

  UserLoginErrorState(this.error);
}
