import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';


class OccasionHomeLayout extends StatefulWidget {
  const OccasionHomeLayout({Key? key}) : super(key: key);

  @override
  State<OccasionHomeLayout> createState() => _OccasionHomeLayoutState();
}

class _OccasionHomeLayoutState extends State<OccasionHomeLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
      listener: (BuildContext context, OccasionStates states) {},
      builder: (BuildContext context, OccasionStates states) {
        OccasionCubit cubit = BlocProvider.of(context);
        //OccasionCubit cubit = OccasionCubit.get(context);

        return Scaffold(
          body: cubit.homeLayoutScreens[cubit.currantNavBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomNavListItem,
            currentIndex: cubit.currantNavBarIndex,
            onTap: (index)
            {
              cubit.changeCategoriesType(index, context);
              cubit.homeChangeIndex(index);
            },
          ),

        );
      },
    );
  }
}
