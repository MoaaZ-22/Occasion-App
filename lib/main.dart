import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasion_app/shared/bloc_observer.dart';
import 'package:occasion_app/shared/network/end_points.dart';
import 'package:occasion_app/shared/network/local/cache_helper.dart';
import 'package:occasion_app/shared/network/remote/dio_helper.dart';
import 'package:occasion_app/shared/styles/themes.dart';
import 'layout/cubit/cubit.dart';
import 'layout/occasion_home_layout.dart';
import 'modules/Login_Screen/Login_Cubit/cubit.dart';
import 'modules/Login_Screen/login_screen.dart';
import 'modules/Onboarding Screen/onboarding_screen.dart';
import 'modules/Register_Screen/Register_Cubit/cubit.dart';

main() async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  // bool to Check If User See onBoarding
  bool? onBoarding = CacheHelper.getDataIntoShPre(key: 'Onboarding');

  // String To Check If User LogIn Or Not
  String? token = CacheHelper.getDataIntoShPre(key: 'token');

  // Widget To Put The Selected Widget That Will Show
  late Widget widget;
  if(onBoarding != null)
  {
    if(token != null)
    {
      widget = const OccasionHomeLayout();
    }
    else
    {
      widget = const OccasionSmartLoginScreen();
    }
  }
  else
  {
    widget = const OnBoardingScreen();
  }
  Bloc.observer = OccasionBlocObserver();
  runApp(OccasionApp(startWidget: widget,));

  // For
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);


}

class OccasionApp extends StatelessWidget {
  final Widget startWidget;
  const OccasionApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MultiBlocProvider(
//---
        providers:
        [
          BlocProvider(
              create: (BuildContext context) => OccasionCubit()..getHallCategories(type: allCategories)
          ),
          BlocProvider(
            create: (BuildContext context) => OccasionLoginCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) => OccasionRegisterCubit(),
          ),
        ],

        child: MaterialApp(
          // Light Mode Theme
          theme: occasionLightTheme,
          debugShowCheckedModeBanner: false,
          // startWidget here
          home: startWidget,
        ),
      );
  }
}