import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:occasion_app/models/Halls_Model/halls_model.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';
import '../../shared/styles/styles.dart';

class HallDetailsScreen extends StatefulWidget {
  final HallHomeData model;
  final String name;
  final String image;
  final String imagePro;
  final String loc;
  final index;

  const HallDetailsScreen({
    Key? key,
    required this.model,
    required this.index,
    required this.name,
    required this.image,
    required this.imagePro,
    required this.loc,
  }) : super(key: key);

  @override
  State<HallDetailsScreen> createState() => _HallDetailsScreenState();
}

class _HallDetailsScreenState extends State<HallDetailsScreen> {
  @override
  Widget build(BuildContext context,) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
        listener: (BuildContext context, OccasionStates states) {},
        builder: (BuildContext context, OccasionStates states) {
          OccasionCubit cubit = BlocProvider.of(context);
          return DefaultTabController(
            length: 4,
            child: SafeArea(
              child: Scaffold(
                body: ConditionalBuilder(
                  condition: states is! GetDetailsHotelsLoadingState,
                  builder: (context) =>
                      NestedScrollView(
                        headerSliverBuilder:
                            (BuildContext context, bool innerBoxIsScrolled) =>
                        [
                          SliverAppBar(
                            leading: const SizedBox(),
                            flexibleSpace: FlexibleSpaceBar(
                              background: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                0.27,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      widget.image),
                                                  fit: BoxFit.fill),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(top: 8),
                                                  child: MaterialButton(
                                                    height: 8,
                                                    onPressed: () =>
                                                        popNavigate(context),
                                                    color: Colors.grey.shade400
                                                        .withOpacity(0.60),
                                                    elevation: 5,
                                                    minWidth: 80,
                                                    shape: const CircleBorder(),
                                                    child: Icon(
                                                      Icons.arrow_back_outlined,
                                                      color: defaultColor,
                                                      size: 32,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 45,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 20,
                                            ),
                                            // Here Text
                                            child: SizedBox(
                                              width: MediaQuery
                                                  .of(context)
                                                  .size
                                                  .width *
                                                  0.68,
                                              child: Text(
                                                widget.name,
                                                style: kDetailsHallNameStyle,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // Profile Photo For Hall ******************
                                      Positioned(
                                          bottom:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.050,
                                          left: 20,
                                          child: Container(
                                            height:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                0.12,
                                            width:
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.25,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      widget.imagePro),
                                                  fit: BoxFit.cover),
                                              border: Border.all(
                                                  color: defaultColor,
                                                  width: 3),
                                              borderRadius: const BorderRadius
                                                  .all(
                                                  Radius.circular(15)),
                                            ),
                                          ))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Icon(
                                          Icons.location_on_rounded,
                                          size: 13,
                                          color: defaultColor,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        SizedBox(
                                          height:
                                          MediaQuery
                                              .of(context)
                                              .size
                                              .height *
                                              0.045,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width *
                                              0.81,
                                          child: Text(
                                            widget.loc,
                                            style: kDetailsHallLocationTextStyle,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            toolbarHeight:
                            MediaQuery
                                .of(context)
                                .size
                                .height * 0.422,
                            floating: true,
                            pinned: true,
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(50),
                              child: Container(
                                decoration:
                                const BoxDecoration(color: Colors.white),
                                child: TabBar(
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    labelStyle: TextStyle(
                                        color: defaultColor,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1),
                                    tabs: cubit.textTabs),
                              ),
                            ),
                          ),
                        ],
                        body: TabBarView(children: cubit.hallDetailsScreenTabs),
                      ),
                  fallback: (context) =>
                      Center(
                          child: CircularProgressIndicator(
                              color: defaultColor, strokeWidth: 5)),
                ),
              ),
            ),
          );
        });
  }
}
