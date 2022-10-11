
import 'package:flutter/material.dart';


class MyBooking extends StatelessWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xffBB2036),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title:Text(
          'My Bookings',
          style:
          TextStyle(color: Color(0xffBB2036), fontWeight: FontWeight.bold),
        ),

      ),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                  ),
                  side: BorderSide(width: 5, color: Color(0xffBB2036),)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.info,
                        color: Color(0xffBB2036),
                      ),
                      title: Text('Offer Name',
                        style: TextStyle(
                          color: Color(0xffBB2036),
                        ),
                      ),
                      subtitle: Text(
                          'Offer details Offer details Offer details Offer details Offer details  '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 45),
                          const Text('3000 EGP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBB2036),
                            ),
                          ),
                          const SizedBox(width: 70),
                          ElevatedButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(0xffBB2036),
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[400],
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xffBB2036),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(5)),
                            onPressed: () {},
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                  ),
                  side: BorderSide(width: 5, color: Color(0xffBB2036),)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.info,
                        color: Color(0xffBB2036),
                      ),
                      title: Text('Hall Name',
                        style: TextStyle(
                          color: Color(0xffBB2036),
                        ),
                      ),
                      subtitle: Text(
                          'Hall details Hall details Hall details Hall details Hall details  '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 45),
                          const Text('50000 EGP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBB2036),
                            ),
                          ),
                          const SizedBox(width: 55),
                          ElevatedButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(0xffBB2036),
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[400],
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xffBB2036),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(5)),
                            onPressed: () {},
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0),
                  ),
                  side: BorderSide(width: 5, color: Color(0xffBB2036),)),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.info,
                        color: Color(0xffBB2036),
                      ),
                      title: Text('Event Name',
                        style: TextStyle(
                          color: Color(0xffBB2036),
                        ),
                      ),
                      subtitle: Text(
                          'Event details Event details Event details Event details Event details  '),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          const SizedBox(width: 45),
                          const Text('300 EGP',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffBB2036),
                            ),
                          ),
                          const SizedBox(width: 75),
                          ElevatedButton(
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                color: Color(0xffBB2036),
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[400],
                                side: const BorderSide(
                                  width: 2,
                                  color: Color(0xffBB2036),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(5)),
                            onPressed: () {},
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
      ),

    );
  }
}
