import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_level_helpers/app_bloc_provider/bloc/states.dart';


class AppCubitClass extends Cubit<AppStates> {
  AppCubitClass() : super(InitialAppState());

  static AppCubitClass get(context) => BlocProvider.of(context);
}
