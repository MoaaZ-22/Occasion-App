import 'package:flutter/material.dart';
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Center(child: Text('الشروط والاحكام',style: TextStyle(color:Colors.black,fontSize: 30),)),
              SizedBox(height: 30,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('اذا تم الغاء الحجز يتم خصم 20% من قيمة المبلغ -'),
                  Text('عدم بيع أو نسخ أو تأجير أو نقل المعلومات والتنازل عنها -'),
                  Text('عدم استخدام الموقع لأغراض غير قانونية - '),
                  Text('عدم الوصول إلى بيانات الشركة أو المستخدمين بدون تصريح - '),
                  Text('عدم تغيير أو المساس بحقوق الملكية الفكرية الخاصة بالشركة -'),
                  Text(' عدم انتهاك الحقوق القانونية لأي شخص آخر - '),
                ],
              ),
              SizedBox(height: 30,),
              Text('Terms and Conditions',style: TextStyle(color:Colors.black,fontSize: 30)),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 30,),
                    Text('- If the reservation is canceled, 20% of the amount will be   deducted'),
                    Text('- Not to sell, copy, rent, transfer or assign information'),
                    Text('- Do not use the site for illegal purposes'),
                    Text('- Do not access company or user data without permission'),
                    Text('- Not to change, modify or infringe the intellectual property   rights of the company'),
                    Text('- Not to infringe anyone else legal rights'),
                  ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}