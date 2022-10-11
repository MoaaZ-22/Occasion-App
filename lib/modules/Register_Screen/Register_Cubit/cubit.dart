// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasion_app/modules/Register_Screen/Register_Cubit/states.dart';
import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../Occasion_Register_Model/register_model.dart';

class OccasionRegisterCubit extends Cubit<OccasionRegisterStates> {
  OccasionRegisterCubit() : super(OccasionInitialRegisterState());

  static OccasionRegisterCubit get(context) => BlocProvider.of(context);

  // Controller For Email In login Screen
  var registerUserNameController = TextEditingController();

  // Controller For Email In login Screen
  var registerEmailController = TextEditingController();

  // Controller For Email In Register Screen
  var registerPasswordController = TextEditingController();

  // Controller For Email In Register Screen
  var registerConfirmPasswordController = TextEditingController();

  // Register Show Password
  bool isPasswordShow = true;

  // Register Confirm Show Password
  bool isConfirmPasswordShow = true;

  // Function For Show And Hide Password In Register Screen
  void showPasswordRegisterScreen() {
    isPasswordShow = !isPasswordShow;
    emit(ShowPasswordOccasionRegisterScreen());
  }

  // Function For Show And Hide Confirm Password In Register Screen
  void showConfirmPasswordInRegister() {
    isConfirmPasswordShow = !isConfirmPasswordShow;
    emit(ShowConfirmPasswordOccasionRegister());
  }

  // Object From Occasion Register Model
  OccasionRegisterModel? occasionRegisterModel;

  // Function For Post Register Data In Apis
  void userRegister({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    emit(OccasionRegisterLoadingState());

    DioHelper.postData(url: register, data: {'name': name, 'email': email, 'password': password, 'password_confirmation' : confirmPassword})
        .then((value) {

      // Object For Modle Fill it With Data From Post Cuz Validation On Api Response
      occasionRegisterModel = OccasionRegisterModel.fromJason(value.data);

      // print(occasionRegisterModel?.message);
      // print(occasionRegisterModel?.token);

      emit(OccasionRegisterSuccessState(occasionRegisterModel!));
    }).catchError((error) {
      emit(OccasionRegisterErrorState(error: error.toString()));
    });
  }

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

  GlobalKey<FormState> registerFormKey =
  GlobalKey<FormState>(debugLabel: 'Register');

  // Validation Function For Email
  String? confirmPasswordValidation(value)
  {
    if (value!.isEmpty)
    {
      return 'This field is required';
    }
    else if(value != registerPasswordController.text)
    {
      return 'Not Match';
    }
    else if(value.trim().length < 8)
    {
      return 'Password must be at least 8 characters in length';
    }
    return null;

  }
}
