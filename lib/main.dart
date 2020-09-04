import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'model/horoscope_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Myhoroscope(),
    );
  }
}

class Myhoroscope extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        title: Text('Your Horoscope'),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [

            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeAries(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.all(14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://imgk.timesnownews.com/story/Aries_May_23.jpg?tr=w-1200,h-900'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Aries',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeLibra(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.deccanherald.com/sites/dh/files/articleimages/2020/08/14/Libra-1590937203-1592524696-1593090940-1593697039-1596741301-1597345922.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Libra',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeLeo(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(left: 14.0,right: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.deccanherald.com/sites/dh/files/articleimages/2020/07/31/Leo-1590936958-1596137401.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Leo',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeCancer(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://blog.psychics.com/wp-content/uploads/2017/06/Cancer-zodiac-sign.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Cancer',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopePisces(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(left: 14.0,right: 14.0,top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.deccanherald.com/sites/dh/files/articleimages/2020/07/27/Pisces-1590963265-1595861086.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Pisces',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeTaurus(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    margin: EdgeInsets.only(top: 14.0),
                    // width: MediaQuery.of(context).size.width * 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.whats-your-sign.com/wp-content/uploads/2017/12/ZodiacSymbolsForTaurus.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Taurus',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeSagittarius(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(left: 14.0,right: 14.0,top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images5.alphacoders.com/103/thumb-1920-1033215.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Sagittarius',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeGemini(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.deccanherald.com/sites/dh/files/articleimages/2020/08/21/gemini%20-%20horoscope-1597951801.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Gemini',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeScorpio(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(left: 14.0,right: 14.0,top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://blog.prepscholar.com/hs-fs/hubfs/zodiac-sign-4374412_1920.jpg?width=459&name=zodiac-sign-4374412_1920.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Scorpio',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeVirgo(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.deccanherald.com/sites/dh/files/articleimages/2020/07/22/Virgo-1595362501.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Virgo',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeCapricorn(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(left: 14.0,right: 14.0,top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://cf.ltkcdn.net/horoscopes/images/orig/258842-1600x1030-animal-is-associated-zodiac-sign-capricorn.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Capricorn',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Text("Today,s Horoscope "),
                          content: FutureBuilder<HoroscopeModel>(
                            future: getHoroscopeAquarius(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final horoscope = snapshot.data;
                                return Text('${horoscope.horoscope}');
                              } else if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              }
                              return CupertinoActivityIndicator();
                            },
                          ),
                          actions: [
                            FlatButton(
                              child: Text(
                                'Ok',
                                style: TextStyle(color: Colors.blue[900]),
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop(false);
                              },
                            )
                          ],
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    height: MediaQuery.of(context).size.height * 0.22,
                    // width: MediaQuery.of(context).size.width * 50,
                    margin: EdgeInsets.only(top: 14.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.deepOrange.withOpacity(0.2),
                              spreadRadius: 3.0,
                              blurRadius: 5.0)
                        ],
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://3.bp.blogspot.com/-jwAa9NSqvbg/W_hx1Cq3IHI/AAAAAAAAAG0/-KmOGD0OInQMQQGm1vQnIdHijKgFWYEZwCLcBGAs/s1600/best-profession-boss-and-business-partner-for-aquarius-sign.jpg'),
                          fit: BoxFit.cover,
                        )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        Text(
                          'Aquarius',
                          style: TextStyle(color: Colors.white, fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }
}

Future<HoroscopeModel> getHoroscopeAries() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/aries";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeLibra() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/libra";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeLeo() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/leo";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeCancer() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/cancer";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopePisces() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/pisces";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeScorpio() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/scorpio";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeTaurus() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/taurus";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeSagittarius() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/sagittarius";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeGemini() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/gemini";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeVirgo() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/virgo";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeCapricorn() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/capricorn";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}

Future<HoroscopeModel> getHoroscopeAquarius() async {
  final url = "http://horoscope-api.herokuapp.com/horoscope/today/aquarius";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonHoroscope = jsonDecode(response.body);
    return HoroscopeModel.fromJson(jsonHoroscope);
  } else {
    throw Exception();
  }
}
