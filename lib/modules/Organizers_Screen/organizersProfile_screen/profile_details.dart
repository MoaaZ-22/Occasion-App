import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../shared/styles/color.dart';
import '../../Halls_Screen/hall_body/reviews.dart';
import 'offers_details.dart';


class OrganizerProfile extends StatelessWidget {
  const OrganizerProfile({required this.teamid, Key? key}) : super(key: key);
  final int? teamid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => OccasionCubit()..getOrganizersProfile(teamid!),
        child: BlocConsumer<OccasionCubit, OccasionStates>(
            listener: (context, OccasionStates states) {},
            builder: (context, OccasionStates states) => ConditionalBuilder(
                condition: states is! OccasionOrganizersDataProfileLoadingState,
                builder: (BuildContext context) => DefaultTabController(
                    length: 2,
                    child: Scaffold(
                      body: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        OccasionCubit.get(context)
                                            .organizersProfileModel
                                            ?.offer?[0]
                                            .image ??
                                            ""),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(50),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
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
                              ),
                              Positioned(
                                top: 140,
                                left: 4,
                                child: Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          OccasionCubit.get(context)
                                              .organizersProfileModel
                                              ?.offer?[0]
                                              .imageProfile ??
                                              ""),
                                    ),
                                    const SizedBox(width: 5),
                                    Container(
                                      height: 40,
                                      width: 140,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomRight: Radius.circular(20)),
                                        color: Colors.grey.shade400
                                            .withOpacity(0.70),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(4, 4),
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(7.0),
                                        child: Center(
                                          child: Text(
                                            OccasionCubit.get(context)
                                                .organizersProfileModel
                                                ?.offer?[0]
                                                .name ??
                                                "",
                                            style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffBB2036),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.grey[500],
                              ),
                              child: TabBar(
                                  labelColor: Colors.black,
                                  unselectedLabelColor: Colors.black,
                                  indicator: BoxDecoration(
                                    color: const Color(0xffBB2036),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  tabs: const [
                                    Tab(
                                      text: 'Offers',
                                    ),
                                    Tab(text: 'Reviews'),
                                  ]),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 350,
                              child: TabBarView(
                                children: [
                                  OffersOrg(
                                      offers: OccasionCubit.get(context)
                                          .organizersProfileModel
                                          ?.offer),
                                  const ReviewsOrg(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                fallback: (BuildContext context) => Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SizedBox(
                      height: 55,
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(100.0),
                          child: Center(
                              child: CircularProgressIndicator(
                                backgroundColor: defaultColor,
                                strokeWidth: 5.0,

                              )
                          )
                      )
                  ),
                )
            )
        )
    );
  }
}
