import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job1/app_layouts/get_info/get_info_layout.dart';
import 'package:job1/app_layouts/login/login_bloc/login_cubit.dart';
import 'package:job1/app_layouts/start/start_layout.dart';
import 'package:job1/app_level_helpers/app_bloc_provider/bloc/states.dart';
import 'package:job1/app_level_helpers/dio_helper/dio.dart';
import 'app_layouts/register/register_bloc/rigester_cubit.dart';
import 'app_level_helpers/app_bloc_provider/bloc/cubit.dart';
import 'app_level_helpers/cash_helper/sharedpref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedCashHelper.init();
  DioHelper.init();

  var start = SharedCashHelper.getValue(key: "start");
  Widget startScreen;
  if (start == false || start == null)
    startScreen = StartAppScreen();
  else
    startScreen = GetInformationScreen();

  runApp(MyApp(startScreen: startScreen));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;

  const MyApp({required this.startScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AppCubitClass()),
          BlocProvider(create: (context) => RegisterCubitClass(),),
          BlocProvider(create: (context) => LoginCubitClass(),),
        ],
        child: BlocConsumer<AppCubitClass, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(
                  scaffoldBackgroundColor: Colors.white,
                  primarySwatch: Colors.deepOrange,
                ),
                home: startScreen,
              );
            }));
  }
}
