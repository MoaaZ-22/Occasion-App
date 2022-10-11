import '../Occasion_Register_Model/register_model.dart';

abstract class OccasionRegisterStates {}

class OccasionInitialRegisterState extends OccasionRegisterStates {}


// Show Password In Register Screen
class ShowPasswordOccasionRegisterScreen extends OccasionRegisterStates{}

// Show Password In Register Screen
class ShowConfirmPasswordOccasionRegister extends OccasionRegisterStates{}


//______________________________________States For Api Register_________________________________//

class OccasionRegisterLoadingState extends OccasionRegisterStates{}

class OccasionRegisterSuccessState extends OccasionRegisterStates{

  final OccasionRegisterModel occasionRegisterModel;


  OccasionRegisterSuccessState(this.occasionRegisterModel);
}

class OccasionRegisterErrorState extends OccasionRegisterStates{
  final String error;

  OccasionRegisterErrorState({required this.error});
}