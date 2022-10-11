// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../layout/cubit/cubit.dart';
import '../../../layout/cubit/states.dart';
import '../../../models/Halls_Model/details_hotels_model.dart';
import '../../../payment/home_payment_view.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/color.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OccasionCubit, OccasionStates>(
      listener: (BuildContext context, OccasionStates states) {},
      builder: (context, state) {
        var dealsModel = OccasionCubit.get(context).detailsOfHotelsModel!;
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                  itemBuilder: (context, index) =>
                      buildCard(dealsModel, context, index),
                  itemCount: dealsModel.deal!.length),
            ),
          ),
        );
      },
    );
  }
}

Widget buildCard(DetailsOfHotelsModel model, context, index) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: double.infinity,
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/handshake.png',
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${model.deal![index].name}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffBB2036),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        " price : ${model.deal![index].pricce}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        children: [
                          Text(
                            '${model.deal![index].numberInvities}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${model.deal![index].numberParagraphs}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 60,
                          ),
                          // Spacer(),
                          InkWell(
                            onTap: () {
                              final firstDate = DateTime(2022, 6, 27);
                              final lastDate = DateTime(2022, 7);
                              final currentDate = DateTime(2022, 6);
                              print('click');
                              showDatePicker(
                                  context: context,
                                  currentDate: currentDate,
                                  initialDate: firstDate,
                                  firstDate: firstDate,
                                  lastDate: lastDate,
                                  builder: (context, child) {
                                    return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                            primary: defaultColor,
                                            onPrimary: Colors.white,
                                            onSurface: defaultColor,
                                          ),
                                        ),
                                        child: child!);
                                  }).then((value) {
                                if (value==null) {
                                  return null;
                                } else {
                                  navigateTo(context, HomePaymentView());
                                }
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 110,
                              decoration: BoxDecoration(
                                color: const Color(0xffBB2036),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
