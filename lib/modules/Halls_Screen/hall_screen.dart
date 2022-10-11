import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';
import '../../shared/styles/styles.dart';

class HallsScreen extends StatelessWidget {
  const HallsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
        listener: (BuildContext context, OccasionStates states) {},
        builder: (BuildContext context, OccasionStates states) {
          return DefaultTabController(
            length: 5,
            child: Scaffold(
              drawer:drawerScreen(context),
              body: NestedScrollView(
                floatHeaderSlivers: true,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) => [
                  SliverAppBar(
                    iconTheme: IconThemeData(
                      color: defaultColor,
                      size: 35,
                    ),
                    floating: true,
                    pinned: true,
                    snap: true,
                    title: Text(
                      appBarText,
                      style: kHomeTitleStyle,
                    ),
                    bottom: TabBar(
                      controller: OccasionCubit.get(context).hallBarIndexController,
                      isScrollable: true,
                      physics: const NeverScrollableScrollPhysics(),
                      onTap: (index) => OccasionCubit.get(context).changeCategoriesType(index,context),
                      tabs: const [
                        Tab(
                          text: 'All',
                        ),
                        Tab(
                          text: 'Meetings',
                        ),
                        Tab(
                          text: 'Weddings',
                        ),
                        Tab(
                          text: 'Birthday',
                        ),
                        Tab(
                          text: 'Graduate',
                        ),
                      ],
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: OccasionCubit.get(context).hallBarIndexController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Tab(child: hallCategoriesBuildItem()),
                    Tab(child: hallCategoriesBuildItem()),
                    Tab(child: hallCategoriesBuildItem()),
                    Tab(child: hallCategoriesBuildItem()),
                    Tab(child: hallCategoriesBuildItem())
                  ],
                ),
              ),
            ),
          );
        });
  }
}
