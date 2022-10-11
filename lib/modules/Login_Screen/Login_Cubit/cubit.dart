// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasion_app/modules/Login_Screen/Login_Cubit/states.dart';
import '../../../shared/components/components.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../Occasion_Login_Model/login_model.dart';
import '../login_screen.dart';

class OccasionLoginCubit extends Cubit<OccasionLoginStates>
{

  OccasionLoginCubit() : super(OccasionInitialLoginState());

  static OccasionLoginCubit get(context) => BlocProvider.of(context);


  // Onboarding Screen Controller
  var boardController = PageController();

  // Boolean For Boarding Screen
  bool isLast = false;

  // Controller For Email In login Screen
  var loginEmailController = TextEditingController();

  // Controller For Email In Register Screen
  var loginPasswordController = TextEditingController();

  // Login Show Password
  bool isTrue = true;


  // Login *****************************************************************************

  // Validation Function For Email
  String? emailValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
    {
      return 'Please enter a valid email address';
    }
    return null;

  }

  // Validation Function For Email
  String? passwordValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value.trim().length < 8)
    {
      return 'Password must be at least 8 characters in length';
    }
    return null;

  }


  // Register ***************************************************************************

  // Validation Function For User Name
  String? userName(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value!.length > 27)
    {
      return 'User name length too much';
    }
    return null;
  }

  // Validation Function For Email
  String? emailRegisterValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
    {
      return 'Please enter a valid email address';
    }
    return null;

  }

  // Validation Function For Email
  String? passwordRegisterValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value.trim().length < 8)
    {
      return 'Password must be at least 8 characters in length';
    }
    return null;

  }

  GlobalKey<FormState> registerFormKey =
  GlobalKey<FormState>(debugLabel: 'Register');

  // // Validation Function For Email
  // String? confirmPasswordValidation(value)
  // {
  //   if (value!.isEmpty)
  //   {
  //     return 'This field is required';
  //   }
  //   else if(value != registerPasswordController.text)
  //   {
  //     return 'Not Match';
  //   }
  //   else if(value.trim().length < 8)
  //   {
  //     return 'Password must be at least 8 characters in length';
  //   }
  //   return null;
  //
  // }

  // Function For Show And Hide Password In Login Screen
  void showPasswordLoginScreen()
  {
    isTrue = !isTrue;
    emit(ShowPasswordOccasionLoginScreen());
  }

  // List Of All Model
  List<BoardingModel> boarding =
  [
    const BoardingModel(boardingTitle: 'We Make it much easier for u!', boardingImage: 'assets/images/Online.svg', boardingBody: 'Save your efforts,book and visit all you want from your place'),
    const BoardingModel(boardingTitle: 'You can see places differently', boardingImage: 'assets/images/images.svg', boardingBody: 'Show places with more reality and you can add your review'),
    const BoardingModel(boardingTitle: 'Enjoy with Event Section', boardingImage: 'assets/images/Events.svg', boardingBody: 'Browse our latest event and select Which one will you attend?'),
  ];


  // Object From Occasion Login Model
  OccasionLoginModel? occasionLoginModel;

  // Function For Post Login Data In Apis
  void userLogin({required String email, required String password}){

    emit(OccasionLoginLoadingState());

    DioHelper.postData(
        url: login,
        data:
        {
          'email' : email,
          'password': password
        }).then((value)
    {

      // Object For Modle Fill it With Data From Post Cuz Validation On Api Response
      occasionLoginModel = OccasionLoginModel.fromJason(value.data);

      // print(occasionLoginModel?.message);
      // print(occasionLoginModel?.token);

      emit(OccasionLoginSuccessState(occasionLoginModel!));
    }).catchError((error)
    {
      emit(OccasionLoginErrorState(error: error.toString()));
    });
  }

  // Method For Save In cache To Skip OnBoarding Screen When User Open
  void submit(BuildContext context)
  {
    CacheHelper.saveData(key: 'Onboarding', value: true).then((value) =>
    {
      pushReplacementNavigate(context, const OccasionSmartLoginScreen())
    }
    );

  }


}