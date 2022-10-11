import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

import '../../../shared/styles/color.dart';

class ReviewsOrg extends StatelessWidget {
  const ReviewsOrg({Key? key}) : super(key: key);

//gfp
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: defaultColor)),
              labelStyle: const TextStyle(
                color: Color(0xffBB6D78),
                fontWeight: FontWeight.bold,
              ),
              labelText: 'Write comment',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            children: [
              const Text('Rate this team: '),
              Rate(
                iconSize: 20,
                color: defaultColor,
                initialValue: 3.5,
                readOnly: false,
                onChange: (value) => print(value),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ElevatedButton(
                    child: const Text(
                      'Submit',
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
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(5)),
                    onPressed: () {}),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset:
                const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 0,
              margin: const EdgeInsets.all(5),
              // user name and comment
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children:<Widget> [
                    Padding(
                      padding: const EdgeInsets.only(left: 120.0),
                      child: Row(
                          children:[
                            const Icon(Icons.star,
                              color: Color(0xffBB2036),
                              size: 20,
                            ),
                            const Icon(Icons.star,
                              color: Color(0xffBB2036),
                              size: 20,
                            ),
                            const Icon(Icons.star,
                              color: Color(0xffBB2036),
                              size: 20,
                            ),
                            const Icon(Icons.star,
                              color: Color(0xffBB2036),
                              size: 20,
                            ),
                          ]
                      ),
                    ),

                    const ListTile(
                      title: Text('User name',
                          style: TextStyle(
                            color: Color(0xffBB2036),
                          )),
                      subtitle: Text(
                          'Good team and they have more experience to organize any event'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

      ],
    );

  }
}