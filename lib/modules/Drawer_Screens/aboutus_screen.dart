
import 'package:flutter/material.dart';
import '../../shared/styles/color.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('About Us',
          style: TextStyle(
              color: Color(0xffBB2036),
              fontWeight: FontWeight.bold
          ),
        )),
        leading:IconButton(
          icon: const Icon(Icons.arrow_back,
            color: Color(0xffBB2036),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          child: Column(
              children :<Widget>[
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        leading: Icon(Icons.info,
                          color:Color(0xffBB2036),
                        ),
                        title: Text('Overview >>',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        subtitle: Text('Occasion Smart System App... \n you can book halls for different categories such as  wedding,birthday,event,and graduation. and we can book organizers team to organize any thing.\n and we can book any tickets for more party with cheap price'),

                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  color: defaultColor,
                  thickness: 2,
                ),
                const ListTile(
                    leading :Icon(Icons.phone,
                      color:Color(0xffBB2036),
                    ),
                    title: Text('Phone',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle:Text('01135478882',

                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    )
                ),
                const SizedBox(height: 10),
                Divider(
                  color: defaultColor,
                  thickness: 2,
                ),
                const ListTile(
                    leading :Icon(Icons.email,
                      color:Color(0xffBB2036),
                    ),
                    title: Text('Email',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    subtitle:Text('occassionsmartsystem@gmail.com')
                ),

              ]
          )
      ),
    );
  }
}
