abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterChangeShopIconState extends RegisterStates {}

class RegisterChangeUserIconState extends RegisterStates {}

class ShopRegisterLoadingState extends RegisterStates {}

class ShopRegisterSuccessState extends RegisterStates {}

class ShopRegisterErrorState extends RegisterStates {
  final String error;

  ShopRegisterErrorState(this.error);
}
class UserRegisterLoadingState extends RegisterStates {}

class UserRegisterSuccessState extends RegisterStates {}

class UserRegisterErrorState extends RegisterStates {
  final dynamic error;

  UserRegisterErrorState(this.error);
}

class UserCreateLoadingState extends RegisterStates {}

class UserCreateSuccessState extends RegisterStates {}

class UserCreateErrorState extends RegisterStates {
  final String error;

  UserCreateErrorState(this.error);
}

class BooleanValueChangedSuccess extends RegisterStates {}
