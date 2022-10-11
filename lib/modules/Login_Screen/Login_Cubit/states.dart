import '../Occasion_Login_Model/login_model.dart';

abstract class OccasionLoginStates {}

class OccasionInitialLoginState extends OccasionLoginStates {}

// Show Password In Login Screen
class ShowPasswordOccasionLoginScreen extends OccasionLoginStates{}

// Show Password In Register Screen
class ShowPasswordOccasionRegisterScreen extends OccasionLoginStates{}

// Show Password In Register Screen
class ShowConfirmPasswordOccasionRegister extends OccasionLoginStates{}

// OnBoarding Screen Navigate if Is last True
class OnBoardingScreenNavigateTrue extends OccasionLoginStates{}

// OnBoarding Screen Cant Navigate if Is last False
class OnBoardingScreenNavigateFalse extends OccasionLoginStates{}


//______________________________________States For Api Login_________________________________//

class OccasionLoginLoadingState extends OccasionLoginStates{}

class OccasionLoginSuccessState extends OccasionLoginStates{

  final OccasionLoginModel occasionLoginModel;

  OccasionLoginSuccessState(this.occasionLoginModel);
}

class OccasionLoginErrorState extends OccasionLoginStates{
  final String error;

  OccasionLoginErrorState({required this.error});
}