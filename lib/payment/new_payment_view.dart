// ignore_for_file: unnecessary_const, non_constant_identifier_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:occasion_app/payment/privacy%20_policy.dart';

import '../shared/components/components.dart';
import '../shared/styles/color.dart';

class NewPaymentView extends StatefulWidget {
  const NewPaymentView({Key? key}) : super(key: key);

  @override
  State<NewPaymentView> createState() => _NewPaymentViewState();
}

class _NewPaymentViewState extends State<NewPaymentView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isChecked = false;
  void printMessage(){
    print('done successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffBB2036),
        title: const Text('Add Payment Info'),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: false,
              isHolderNameVisible: true,
              obscureCardNumber: true,
              obscureCardCvv: true,
              onCreditCardWidgetChange: (creditCardBrand) {},
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  CreditCardForm(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    themeColor: Colors.black,
                    formKey: formKey,
                    cardNumberDecoration: CustomInputDecoration(
                        labelText: "Number", hintText: 'xxxx xxxx xxxx xxxx'),
                    expiryDateDecoration: CustomInputDecoration(
                        labelText: 'Expired Date', hintText: 'xx/xx'),
                    cvvCodeDecoration: CustomInputDecoration(
                        labelText: 'CVV', hintText: 'xxx'),
                    cardHolderDecoration: CustomInputDecoration(
                      labelText: 'Card Holder',
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.only(top: 12, left: 20),
                    child: Row(
                      children: [
                        Checkbox(value: isChecked,
                        activeColor: defaultColor,
                        onChanged: (bool ? newValue){
                         setState(() {
                           isChecked = newValue!;
                         });
                        },
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const[
                                Text(
                                  'you are ready to accept the',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                                Text(
                                  'privacy policy & Services & Agreements',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: MaterialButton(
                      elevation: 2,
                      onPressed: isChecked? () => dialogBox(context): null,
                      textColor: Colors.white,
                      color: defaultColor,
                      child: Text('Confirm',style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Montserrat'),),
                    ),
                  )

                ],
              ),
            )),
          ],
        ),
      ),
    );


  }

  CustomInputDecoration({labelText, hintText}) {
    return InputDecoration(
      labelText: labelText,
      contentPadding: EdgeInsets.only(
        left: 25,
      ),
      hintText: hintText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
    );
  }

  String cardNumber = '';

  String expiryDate = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
