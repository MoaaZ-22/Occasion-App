 // ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../models/Events/Events_Model.dart';
import '../../payment/home_payment_view.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/color.dart';


class SecondScreenEvents extends StatelessWidget {
  const SecondScreenEvents({Key? key, required this.Mo}) : super(key: key);
  final Data? Mo;
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<OccasionCubit,OccasionStates>(
      listener:(context,state) {},
      builder:(context,state){
        return Scaffold(
          body:SingleChildScrollView(
            child: Column(
              children: [
                // image /////////////////////////////////////////////
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular((40)),
                      ),
                      image:  DecorationImage(
                          image: NetworkImage(
                              "${Mo?.image}"),
                          fit: BoxFit.fill),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 1),
                        )
                      ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10,bottom: 8),
                      child: Center(
                        child: Text(
                          '${Mo?.name}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBB2036),
                              fontSize: 20),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),

                      // Container have details

                      child: Container(
                        width: MediaQuery.of(context).size.width * .9,
                        height: MediaQuery.of(context).size.height * .2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                blurRadius: 7,
                                offset: const Offset(0, 1),
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children:  [
                                    Icon(Icons.date_range,
                                      color: defaultColor, size: 25),
                                  const   SizedBox(width: 10),
                                  Text(
                                    '${Mo?.dateTime} ',
                                    style: const  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children:  [
                                  const  Icon(Icons.offline_pin,
                                      color: Color(0xffBB2036), size: 25),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${Mo?.typeof}',
                                    style: const  TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  )
                                ],
                              ),
                              Row(
                                children:  [
                                  const  Icon(Icons.access_time_rounded,
                                      color: Color(0xffBB2036), size: 25),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${Mo?.createdAt}',
                                    style: const  TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children:  [
                                  const  Icon(Icons.confirmation_num_outlined,
                                      color: Color(0xffBB2036), size: 25),
                                  const SizedBox(width: 10),
                                  Text(
                                    '${Mo?.price}',
                                    style:  const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    // About (details) ///////////////////////
                    Column(
                      children: [
                        Row(
                          children: const [
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'About',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                         Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            '${Mo?.about}',
                            style:  const TextStyle(fontSize: 15, color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 20,
                          ),
                        ),
                        const SizedBox(height: 50,)

                      ],
                    )
                  ],
                )
              ],
            ),
          ) ,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {

               navigateTo(context,  HomePaymentView() );

              // Add your onPressed code here!
            },
            label: const Text('Book Now'),
            icon: const Icon(Icons.add_shopping_cart),
            backgroundColor: const Color(0xffBB2036),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        );
      } ,
    );
  }

}

