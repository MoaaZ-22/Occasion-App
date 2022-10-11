import '../../models/Events/Events_Model.dart';
import '../../models/Halls_Model/halls_model.dart';
import '../../models/Organizers_Model/organizers_model.dart';
import '../../models/Organizers_Model/profile_model.dart';

abstract class OccasionStates {}

class OccasionInitialState extends OccasionStates {}

// Change Index NavigationBar
class OccasionBottomNavStates extends OccasionStates{}

// ------------------------------------- Occasion Get Hall Data -----------------------------------------------


class OccasionHallDataLoadingState extends OccasionStates{}

class OccasionHallDataSuccessState extends OccasionStates{

  final HallHomeModel hallHomeModel;

  OccasionHallDataSuccessState(this.hallHomeModel);
}

class OccasionHallDataErrorState extends OccasionStates{
  final String error;

  OccasionHallDataErrorState({required this.error});
}

// --------------------------------------- Occasion Get Organizers Data -----------------------------------------------

class OccasionOrganizersDataLoadingState extends OccasionStates{}

class OccasionOrganizersDataSuccessState extends OccasionStates{

  final OrganizerHomeModel organizerHomeModel;

  OccasionOrganizersDataSuccessState(this.organizerHomeModel);
}

class OccasionOrganizersDataErrorState extends OccasionStates{
  final String error;

  OccasionOrganizersDataErrorState({required this.error});
}

// ----------------------- Occasion Get Organizers Data Profiles ------------------------------------------

class OccasionOrganizersDataProfileLoadingState extends OccasionStates{}

class OccasionOrganizersDataProfileSuccessState extends OccasionStates{

  ProfileModel? organizersOffersModel;

  OccasionOrganizersDataProfileSuccessState(this.organizersOffersModel);
}

class OccasionOrganizersDataProfileErrorState extends OccasionStates{
  final String error;

  OccasionOrganizersDataProfileErrorState({required this.error});
}

// --------------------------------------- Occasion Hall Categories index -------------------------------------------

class OccasionResetIndexState extends OccasionStates{}

// --------------------------------------- Occasion Event Get Data -------------------------------------------

class OccasionEventsLoading extends OccasionStates{}


class OccasionEventsSuccess extends OccasionStates{

  OdaModel? odaModel;

  OccasionEventsSuccess(this.odaModel);
}

class OccasionEventsError extends OccasionStates{}

// --------------------------------------- Occasion Details Hotels-------------------------------------------

class GetDetailsHotelsLoadingState extends OccasionStates {}

class GetDetailsHotelsSuccessState extends OccasionStates {}

class GetDetailsHotelsErrorState extends OccasionStates {}

