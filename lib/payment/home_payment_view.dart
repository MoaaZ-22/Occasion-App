// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_print, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import '../shared/components/components.dart';
import 'new_payment_view.dart';


class HomePaymentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Cards'),
        backgroundColor: Color(0xffBB2036),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15.0, left: 15, top: 15),
        child: Column(
          children: [
            //add new car button
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Color(0xffBB2036), borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 20,
                ),
                child: MaterialButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    pushReplacementNavigate(context, NewPaymentView());

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add New Card',
                        style: TextStyle(fontSize: 20,color: Colors.white),

                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), //list cards
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:2,
                itemBuilder: (BuildContext context, int index) {
                  return  Container(
                    child: CreditCardWidget(
                      width: MediaQuery.of(context).size.width,
                      cardNumber:'3461 9822 9873 1754',
                      expiryDate: '15/8          ',

                      cardHolderName: 'Abdel-Rahman Osama',
                      cvvCode: '333',
                      showBackView: false,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      onCreditCardWidgetChange: (creditCardBrand) {

                      },
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }


}
