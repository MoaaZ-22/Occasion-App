// ignore_for_file: must_be_immutable




import 'package:flutter/material.dart';


import '../../../models/Organizers_Model/profile_model.dart';

import '../../../payment/home_payment_view.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/color.dart';

class OffersOrg extends StatefulWidget {
  const OffersOrg({Key? key, required this.offers}) : super(key: key);
  final List<Offer>? offers;

  @override
  State<OffersOrg> createState() => _OffersOrgState();
}

class _OffersOrgState extends State<OffersOrg> {
  DateTime data = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.offers!.length,
        itemBuilder: (ctx, index) =>
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),

              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),


                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading:  const Icon(Icons.info,
                          color: Color(0xffBB2036),
                        ),
                        title: Text(
                          widget.offers![index].offerName ?? "",
                          style: const TextStyle(
                              color: Color(0xffBB2036),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              widget.offers![index].offerDescription ?? ""),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 45),
                            Text(
                              '${widget.offers![index].price ?? "" } EGP',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffBB2036),
                              ),
                            ),
                            Spacer(),
                            ElevatedButton(
                                child: const Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: defaultColor,
                                    side: const BorderSide(
                                      width: 2,
                                      color: Color(0xffBB2036),
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10)),
                                    padding: const EdgeInsets.all(5)),
                                onPressed: () {
                                  final firstDate = DateTime(2022, 6,27);
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
                                        child: child!
                                    );
                                  }
                                  ).then((value) {
                                    navigateTo(context, HomePaymentView());
                                  });
                                }),
                            SizedBox(width: 15,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
    );
  }
}