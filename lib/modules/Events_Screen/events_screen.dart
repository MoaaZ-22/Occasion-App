import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';
import '../../shared/styles/styles.dart';
import 'Second_screen_events.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
        listener: (BuildContext context, OccasionStates states) {},
        builder: (BuildContext context, OccasionStates states) {
          return Scaffold(
            appBar: homeLayoutAppBar,
            drawer: drawerScreen(context),
            body: ConditionalBuilder(
              condition: states is OccasionEventsSuccess,
              builder:(BuildContext context) =>Column(
                children: [
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10,bottom: 10,),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: InkWell(
                          onTap: (){
                            navigateTo(context, SecondScreenEvents(Mo: OccasionCubit.get(context).Events?.data?[index] ,) );
                          },
                          // big container
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                                color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // container have image
                                  SizedBox(
                                    height:
                                    MediaQuery.of(context).size.height * .19,
                                    width: MediaQuery.of(context).size.width * .37,
                                    // decoration: BoxDecoration(
                                    //   image:  DecorationImage(
                                    //       image:   NetworkImage(
                                    //           '${OccasionCubit.get(context).Events?.data?[index].image}'),
                                    //       fit: BoxFit.fill),
                                    //   borderRadius: BorderRadius.circular(15),
                                    // ),
                                    child: CachedNetworkImage(
                                      imageUrl: '${OccasionCubit.get(context).Events?.data?[index].image}',
                                      height: MediaQuery.of(context).size.height*0.315,
                                      fit: BoxFit.fill,
                                      width: double.infinity,
                                      placeholder: (context, url) =>
                                          Center(
                                            child: SizedBox(
                                                height: 25,
                                                width: 25,
                                                child: CircularProgressIndicator(color: defaultColor,strokeWidth: 5,)),
                                          ),
                                      errorWidget: (context, url, error) => Center(child: SvgPicture.asset('assets/images/error.svg')),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // container have title
                                        Container(
                                          height:
                                          MediaQuery.of(context).size.height *
                                              .1,
                                          width: MediaQuery.of(context).size.width *
                                              .47,
                                          decoration: BoxDecoration(
                                              borderRadius: const BorderRadius.only(
                                                  topRight: Radius.circular(25),
                                                  bottomRight: Radius.circular(25)),
                                              color: Colors.grey.withOpacity(.1)),
                                          child:  Padding(
                                            padding:const  EdgeInsets.all(10),
                                            child: Text(
                                              '${OccasionCubit.get(context).Events?.data?[index].name}',
                                              style: kEventsStyle,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children:  [
                                            const Icon(
                                              Icons.location_on,
                                              color: Color(0xffBB2036),
                                              size: 17,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Expanded(
                                              child: Text(
                                                '${OccasionCubit.get(context).Events?.data?[index].address}',
                                                style: const TextStyle(
                                                    color: Colors.grey, fontSize: 15,overflow: TextOverflow.ellipsis),maxLines: 3,
                                              ),
                                            ),
                                          ],
                                        ),


                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.date_range,color: defaultColor,size: 20,),
                                            const SizedBox(width: 5,),
                                            Text(
                                              '${OccasionCubit.get(context).Events?.data?[index].dateTime}',
                                              style: const TextStyle(
                                                  color: Colors.grey, fontSize: 15),
                                            ),
                                            const Spacer(),
                                            //container have salary
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Colors.grey
                                                        .withOpacity(.1)),
                                                child:  Padding(
                                                  padding:const  EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "${OccasionCubit.get(context).Events?.data?[index].price!}",
                                                    style:const  TextStyle(
                                                        color: Color(0xffBB2036),
                                                        fontWeight:
                                                        FontWeight.bold),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: OccasionCubit.get(context).Events?.data?.length,
                    ),
                  ),
                ],
              ),
              fallback: (BuildContext context) => Center(
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Center(
                    child:
                    CircularProgressIndicator(color: defaultColor, strokeWidth: 5),
                  ),
                ),
              ),
            ),


          );
        });
  }
}
