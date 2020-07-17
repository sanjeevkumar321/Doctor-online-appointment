import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:numed/constants/color_constant.dart';
import 'package:numed/constants/style_constant.dart';
import 'package:numed/models/carousel_model.dart';
import 'package:numed/models/popular_destination_model.dart';

import 'package:numed/widgets/bottom_navigation.dart';
import 'package:numed/screens/get_all_doctors_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up AppBar
      appBar: AppBar(
        backgroundColor: BackgroundColor,
        title: Image.asset('assets/images/technogenr.png', fit: BoxFit.cover),
        elevation: 0,
      ),

      // Setting up Background Color
      backgroundColor: BackgroundColor,

      // Setting up Custom Bottom Navigation Bar
      bottomNavigationBar: BoottomNavigation(),

      // Body
      body: Center(
        child: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: <Widget>[
              // Promos Section
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 24),
                child: Text(
                  'Hi, Franklin 👋 This Promos for You!',
                  style: mTitleStyle,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 190,
                      child: Swiper(
                        onIndexChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        autoplay: true,
                        layout: SwiperLayout.DEFAULT,
                        itemCount: carousels.length,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(
                                    carousels[index].image,
                                  ),
                                  fit: BoxFit.cover),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: map<Widget>(
                            carousels,
                            (index, image) {
                              return Container(
                                alignment: Alignment.centerLeft,
                                height: 6,
                                width: 6,
                                margin: EdgeInsets.only(right: 8),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? headingColor
                                        : mGreyColor),
                              );
                            },
                          ),
                        ),

                        // More
                        Text(
                          'More...',
                          style: mMoreDiscountStyle,
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Service Section
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
                child: Text(
                  'we are here for you!',
                  style: mTitleStyle,
                ),
              ),

              Container(
                height: 227,
                margin: EdgeInsets.only(left: 32.0, right: 32.0),
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => getDoctors()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Start Booking',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        ' Available here',
                                        style: mServiceSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => getDoctors()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Gallery',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'Know About Us',
                                        style: mServiceSubtitleStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'My Report',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'E-report Here',
                                        style: mServiceSubtitleStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Prescription',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'what to do',
                                        style: mServiceSubtitleStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'Prescription',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'what to do',
                                        style: mServiceSubtitleStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            width: 155,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg/service_flight_icon.svg',
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        'About Us',
                                        style: mServiceTitleStyle,
                                      ),
                                      Text(
                                        'who we are',
                                        style: mServiceSubtitleStyle,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // Popular Destination Section
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
                child: Text(
                  'Popular Doctors!',
                  style: mTitleStyle,
                ),
              ),
              Container(
                height: 140,
                child: ListView.builder(
                  itemCount: populars.length,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Container(
                        height: 140,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: mBorderColor, width: 1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 16),
                          child: Column(
                            children: <Widget>[
                              Image.asset(
                                populars[index].image,
                                height: 74,
                              ),
                              Text(
                                populars[index].name,
                                style: mPopularDestinationTitleStyle,
                              ),
                              Text(
                                populars[index].country,
                                style: mPopularDestinationSubtitleStyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Travlog Section
              Padding(
                padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
                child: Text(
                  'Travlogs!',
                  style: mTitleStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
