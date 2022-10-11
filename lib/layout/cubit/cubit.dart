// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasion_app/layout/cubit/states.dart';
import '../../models/Events/Events_Model.dart';
import '../../models/Halls_Model/details_hotels_model.dart';
import '../../models/Halls_Model/halls_model.dart';
import '../../models/Organizers_Model/organizers_model.dart';
import '../../models/Organizers_Model/profile_model.dart';
import '../../modules/Events_Screen/events_screen.dart';
import '../../modules/Halls_Screen/hall_body/deals.dart';
import '../../modules/Halls_Screen/hall_body/info.dart';
import '../../modules/Halls_Screen/hall_body/photos.dart';
import '../../modules/Halls_Screen/hall_screen.dart';
import '../../modules/Organizers_Screen/organizersProfile_screen/reviews_details.dart';
import '../../modules/Organizers_Screen/organizers_screen.dart';
import '../../shared/network/end_points.dart';
import '../../shared/network/remote/dio_helper.dart';



class OccasionCubit extends Cubit<OccasionStates> {

  OccasionCubit() : super(OccasionInitialState());

  static OccasionCubit get(context) => BlocProvider.of(context);

  // Currant Index For Bottom Navigation Bar
  int currantNavBarIndex = 0;

  // Controller For Reset Index From Hall Bottom Bar
  TabController? hallBarIndexController;

  // Calling Hall Model And Make An Object From Him To Call And Fill Him In Get Function
  HallHomeModel? hallHomeModel;

  // Function For Get Data For Hall And their Categories
  void getHallCategories({required String type})
  {
    emit(OccasionHallDataLoadingState());
    DioHelper.getData(url: type).then((value)
    {
      hallHomeModel = HallHomeModel.fromJson(value.data);
      // Test Data From Api
      print(value.data.toString());
      emit(OccasionHallDataSuccessState(hallHomeModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(OccasionHallDataErrorState(error: error.toString()));
    }
    );
  }

  // Function For Get Data For Organizers Teams //

  OrganizerHomeModel? organizerHomeModel;

  void getOrganizersData()
  {
    emit(OccasionOrganizersDataLoadingState());
    DioHelper.getData(url:getInformation).then((value)

    {
      organizerHomeModel = OrganizerHomeModel.fromJson(value.data);

      print(organizerHomeModel?.data?[0].image);
      emit(OccasionOrganizersDataSuccessState(organizerHomeModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(OccasionOrganizersDataErrorState(error: error.toString()));
    }
    );
  }

  ProfileModel? organizersProfileModel;

  void getOrganizersProfile(int id)
  {
    emit(OccasionOrganizersDataProfileLoadingState());
    DioHelper.getData(url:'getioffer/$id').then((value) {
      organizersProfileModel = ProfileModel.fromJson(value.data);

      print(organizersProfileModel?.offer?[0].name);
      emit(OccasionOrganizersDataProfileSuccessState(organizersProfileModel!));
    }
    ).catchError((error)
    {
      print(error.toString());
      emit(OccasionOrganizersDataProfileErrorState(error: error.toString()));
    }
    );
  }
  //  Hall Details Screen List Of Tabs

  List<Tab> textTabs = const
  [
    Tab(
      text: 'Info',
    ),
    Tab(
      text: 'Photos',
    ),
    Tab(
      text: 'Deals',
    ),
    Tab(
      text: 'Reviews',
    ),
  ];

  // TabBar List In Hall Details Screen
  List<Tab> hallDetailsScreenTabs =
  [
    const Tab(child:
    Center(
      child: InfoScreen(),
    ),
    ),
    const Tab(
      child: Center(
        child: PhotosScreen(),
      ),
    ),
    const Tab(
      child: Center(child: DealsScreen()),
    ),
    const Tab(
      child: Center(
        child: ReviewsOrg(),
      ),
    )
  ];

  //List For Bottom Navigation Bar
  List<BottomNavigationBarItem> bottomNavListItem =
  [
    const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Hall'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.people_rounded), label: 'organizers'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.confirmation_num), label: 'Events'),
  ];


  //List For Halls Organizers and Event Screen
  List<Widget> homeLayoutScreens =
  [
    const HallsScreen(),
    const OrganizersScreen(),
    const EventsScreen()
  ];

  // Function For Change Index
  void homeChangeIndex(int index) {
    currantNavBarIndex = index;
    // Loading getOrganizersData After HallData ***** Solved
    if (index == 1)
    {
      getOrganizersData();
    }
    if (index == 2)
      {
        EventM();
      }
    // فاضل ال if بتاعت منوفي ال هنا عشان ال function بتاعت ال git تيجي متعملش مشكله زي بتاعت joooo
    emit(OccasionBottomNavStates());
  }

  // If Statement For Check Index And Change It  For Categories
  // في مشكله هنا تبع معاذ بيحل فيها
  void changeCategoriesType(index, BuildContext context)
  {
    if (index == 0)
    {
      OccasionCubit.get(context).getHallCategories(type: allCategories);
      emit(OccasionResetIndexState());
    }
    else if(index == 1)
    {
      OccasionCubit.get(context).getHallCategories(type: meetingCategories);
      emit(OccasionResetIndexState());
    }
    else if(index == 2)
    {
      OccasionCubit.get(context).getHallCategories(type: weddingCategories);
      emit(OccasionResetIndexState());
    }
    else if(index == 3)
    {
      OccasionCubit.get(context).getHallCategories(type: birthdayCategories);
      emit(OccasionResetIndexState());
    }
    else if(index == 4)
    {
      OccasionCubit.get(context).getHallCategories(type: graduateCategories);
      emit(OccasionResetIndexState());
    }
  }

  OdaModel? Events;

  void EventM(){
    emit(OccasionEventsLoading());
    DioHelper.getData(url: 'getcatdeatils').then((value) {
      Events=OdaModel.fromJson(value.data);

      // print(Events?.data?[0].image);
      // For Print Data From Model
      // print(Mans);
      emit(OccasionEventsSuccess(Events!));

    }).catchError((onError){
      print('Some thing Error happened in Event api $onError');
      emit(OccasionEventsError());
    });

  }

  DetailsOfHotelsModel? detailsOfHotelsModel;

  void getDetailsOfHotels({required String names}) async {
    emit(GetDetailsHotelsLoadingState());
    //print(name);
    await DioHelper.getData(url: '$getDetails$names').then((value) {
      detailsOfHotelsModel = DetailsOfHotelsModel.fromJson(value.data);
      print('=========================Value===================');
      print(value);
      emit(GetDetailsHotelsSuccessState());
    }).catchError((error) {
      emit(GetDetailsHotelsErrorState());
      print(error.toString());
    });
  }
}