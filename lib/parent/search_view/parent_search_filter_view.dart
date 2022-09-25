import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../parent_bottombar_view.dart/parent_bottombar_view.dart';
import 'Controller/parentSearch_Controller.dart';
import 'package:get/get.dart';

class parent_search_filter_view extends StatefulWidget {
  const parent_search_filter_view({Key, key}) : super(key: key);

  @override
  _parent_search_filter_viewState createState() =>
      _parent_search_filter_viewState();
}

class _parent_search_filter_viewState extends State<parent_search_filter_view> {
  RangeValues _currentRangeValues =  RangeValues(0, 100);
  RangeValues _currentRangeValues1 = RangeValues(0, 100);
  parentSearch_Controller search_controller =
      Get.put(parentSearch_Controller());
  var status1 = false;
  var status2 = true;
  var status3 = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status1=search_controller.special.value;
    status2=search_controller.home.value;
    status3=search_controller.go.value;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            parent_bottombar_viewState.selectedIndex = 0;
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        parent_bottombar_view()),(route) => false,);
                            },
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Text(
                        'Filter',
                        style: GoogleFonts.raleway(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            ' Top Rating',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: (){
                          search_controller.ratting.value=1;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  RatingBar(
                                    glow: false,
                                    updateOnDrag: false,
                                    initialRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      half: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      empty: Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                 InkWell(child: Container(height: 20,width: 100,))
                                ],
                              ),
                              search_controller.ratting.value==1?Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.green,
                              ): Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          search_controller.ratting.value=2;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             Stack(children: [
                               RatingBar(
                                glow: false,
                                updateOnDrag: false,
                                initialRating: 2,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 20,
                                ratingWidget: RatingWidget(
                                  full: Icon(
                                    Icons.star,
                                    color: Colors.orange.shade800,
                                  ),
                                  half: Icon(
                                    Icons.star,
                                    color: Colors.orange.shade800,
                                  ),
                                  empty: Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),                                 InkWell(child: Container(height: 20,width: 100,))
                             ]),
                              search_controller.ratting.value==2?Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.green,
                              ): Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          search_controller.ratting.value=3;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  RatingBar(
                                    glow: false,
                                    updateOnDrag: false,
                                    initialRating: 3,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      half: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      empty: Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  InkWell(child: Container(height: 20,width: 100,))

                                ],
                              ),
                              search_controller.ratting.value==3?Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.green,
                              ): Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          search_controller.ratting.value=4;
                          setState(() {

                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  RatingBar(
                                    glow: false,
                                    updateOnDrag: false,
                                    initialRating: 4,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      half: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      empty: Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  InkWell(child: Container(height: 20,width: 100,))

                                ],
                              ),
                              search_controller.ratting.value==4?Icon(
                                Icons.check,
                                size: 20,
                                color: Colors.green,
                              ): Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            search_controller.ratting.value=5;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  RatingBar(
                                    glow: false,
                                    updateOnDrag: false,
                                    initialRating: 5,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 20,
                                    ratingWidget: RatingWidget(
                                      full: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      half: Icon(
                                        Icons.star,
                                        color: Colors.orange.shade800,
                                      ),
                                      empty: Icon(
                                        Icons.star_border_outlined,
                                        color: Colors.orange.shade800,
                                      ),
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  InkWell(child: Container(height: 20,width: 100,))

                                ],
                              ),
                             search_controller.ratting.value==5?Icon(
                               Icons.check,
                               size: 20,
                               color: Colors.green,
                             ): Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.moneyBill1Wave,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            '  Price Range (per hour)',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],

                      ),
                      SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 1,
                          ),
                          child: RangeSlider(
                            values: _currentRangeValues,
                            max: 10000,
                            divisions: 1000,
                            activeColor: Theme.of(context).primaryColor,
                            inactiveColor: Colors.grey.shade200,
                            labels: RangeLabels(
                              _currentRangeValues.start.round().toString(),
                              _currentRangeValues.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues = values;
                                search_controller.minPrice.value =
                                    _currentRangeValues.start;
                                search_controller.maxPrice.value =
                                    _currentRangeValues.end;
                              });
                            },
                          )),
                    ])),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            '  Distance (km)',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SliderTheme(
                          data: SliderThemeData(
                            trackHeight: 1,
                          ),
                          child: RangeSlider(
                            values: _currentRangeValues1,
                            max: 1000,
                            divisions: 1000,
                            activeColor: Theme.of(context).primaryColor,
                            inactiveColor: Colors.grey.shade200,
                            labels: RangeLabels(
                              _currentRangeValues1.start.round().toString(),
                              _currentRangeValues1.end.round().toString(),
                            ),
                            onChanged: (RangeValues values) {
                              setState(() {
                                _currentRangeValues1 = values;
                                search_controller.mindist.value =
                                    _currentRangeValues1.start;
                                search_controller.maxdist.value =
                                    _currentRangeValues1.end;
                              });
                            },
                          )),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.wheelchair,
                                size: 20,
                                color: Colors.grey,
                              ),
                              Text(
                                '  Special Needs',
                                style: GoogleFonts.raleway(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Container(
                            width: 50,
                            child: FlutterSwitch(
                              width: 50.0,
                              height: 30.0,
                              toggleSize: 20.0,
                              value: status1,
                              borderRadius: 30.0,
                              padding: 5.0,
                              activeColor: Theme.of(context).primaryColor,
                              onToggle: (val) {
                                setState(() {
                                  status1 = val;
                                  search_controller.special.value=val;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.baby,
                            size: 20,
                            color: Colors.grey,
                          ),
                          Text(
                            '  Sitter Type',
                            style: GoogleFonts.raleway(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '  Home Sitter',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Container(
                              width: 50,
                              child: FlutterSwitch(
                                width: 50.0,
                                height: 30.0,
                                toggleSize: 20.0,
                                value: status2,
                                borderRadius: 30.0,
                                padding: 5.0,
                                activeColor: Theme.of(context).primaryColor,
                                onToggle: (val) {
                                  setState(() {
                                    status2 = val;
                                    search_controller.home.value=val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '  Goto Sitter',
                              style: GoogleFonts.raleway(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            Container(
                              width: 50,
                              child: FlutterSwitch(
                                width: 50.0,
                                height: 30.0,
                                toggleSize: 20.0,
                                value: status3,
                                borderRadius: 30.0,
                                padding: 5.0,
                                activeColor: Theme.of(context).primaryColor,
                                onToggle: (val) {
                                  setState(() {
                                    status3 = val;
                                    search_controller.go.value=val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                    parent_bottombar_viewState.selectedIndex = 12;
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                parent_bottombar_view()),(route) => false,);                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(1000))),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 5),
                                      child: Center(
                                        child: Text(
                                          'Apply',
                                          style: GoogleFonts.raleway(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {
                                     status1 = false;
                                     status2 = true;
                                     status3 = true;
                                     search_controller.go.value=true;
                                     search_controller.home.value=true;
                                     search_controller.special.value=false;
                                    search_controller.minPrice.value=0;
                                    search_controller.maxPrice.value=1000;
                                    search_controller.mindist.value=0;
                                    search_controller.maxdist.value=1000;
                                    search_controller.ratting.value=5;
                                     parent_bottombar_viewState.selectedIndex = 12;
                                     Navigator.of(context).pushAndRemoveUntil(
                                         MaterialPageRoute(
                                             builder: (context) =>
                                                 parent_bottombar_view()),(route) => false,);                                  },
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      primary: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(1000),
                                          side: BorderSide(
                                              width: 2,
                                              color:
                                                  Theme.of(context).primaryColor))),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5.0, horizontal: 5),
                                      child: Center(
                                        child: Text(
                                          'Reset',
                                          style: GoogleFonts.raleway(
                                              color: Theme.of(context).primaryColor,
                                              fontSize: 16),
                                        ),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
