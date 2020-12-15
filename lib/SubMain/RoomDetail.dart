import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/SubMain/BookQueue.dart';
import 'package:icarehotel/color.dart';
import 'package:flutter/material.dart';
import 'package:image_slider/image_slider.dart';
import 'package:like_button/like_button.dart';

class RoomDetail extends StatefulWidget {
  String typename;
  RoomDetail({this.typename});
  @override
  _RoomDetailState createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> links = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg'
  ];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.firstTheme,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: size.height * 0.05,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          widget.typename,
          style: GoogleFonts.k2d(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ),
        backgroundColor: ColorTheme.firstTheme,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorTheme.firstTheme,
          child: Column(
            children: [
              ImageSlider(
                showTabIndicator: true,
                tabIndicatorColor: ColorTheme.secondTheme,
                tabIndicatorSelectedColor: ColorTheme.gold,
                tabIndicatorHeight: 10,
                tabIndicatorSize: 10,
                tabController: tabController,
                curve: Curves.fastOutSlowIn,
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.25,
                autoSlide: true,
                duration: new Duration(seconds: 5),
                allowManualSlide: true,
                children: links.map((String link) {
                  return new ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      link,
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: ColorTheme.secondTheme,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.domain, color: Colors.white),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              widget.typename,
                              style: GoogleFonts.k2d(
                                color: Colors.white,
                                fontSize: size.height * 0.02,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '฿ 1,875.00 บาท',
                          style: GoogleFonts.k2d(
                            color: Colors.red,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: ColorTheme.gold,
                      thickness: 1,
                    ),
                    Row(
                      children: [
                        Icon(Icons.people, color: Colors.white),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          '2 persons (max. 2 persons)',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.hotel, color: Colors.white),
                        SizedBox(width: size.width * 0.015),
                        Text(
                          '2 Twins Bed',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.weekend, color: Colors.white),
                        SizedBox(width: size.width * 0.015),
                        Text(
                          '1 bed room, 1 bath room',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.landscape, color: Colors.white),
                        SizedBox(width: size.width * 0.015),
                        Text(
                          'Garden View',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range, color: Colors.white),
                        SizedBox(width: size.width * 0.015),
                        Text(
                          'Check-in : 14:00',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                        SizedBox(width: size.width * 0.015),
                        Text(
                          'Check-out : 12:00',
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontSize: size.height * 0.015,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            LikeButton(
                              size: 30,
                              countPostion: CountPostion.bottom,
                              circleColor: CircleColor(
                                start: ColorTheme.email,
                                end: ColorTheme.email,
                              ),
                              bubblesColor: BubblesColor(
                                dotPrimaryColor: ColorTheme.email,
                                dotSecondaryColor: Colors.amber[50],
                              ),
                              likeBuilder: (bool isLiked) {
                                return Icon(
                                  Icons.favorite,
                                  color:
                                      isLiked ? ColorTheme.email : Colors.grey,
                                  size: 20,
                                );
                              },
                              likeCount: 30056,
                              countBuilder:
                                  (int count, bool isLiked, String text) {
                                var color =
                                    isLiked ? ColorTheme.email : Colors.grey;
                                Widget result;
                                if (isLiked) {
                                  result = Text(
                                    "like",
                                    style: TextStyle(color: color),
                                  );
                                } else if (!isLiked) {
                                  result = Text(
                                    text,
                                    style: TextStyle(color: color),
                                  );
                                  return result;
                                }
                              },
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text(
                                '330125',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.person_pin,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 6),
                              child: Text(
                                '330125',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Divider(
                        indent: 10,
                        endIndent: 10,
                        color: ColorTheme.gold,
                        thickness: 1),
                    Container(
                      margin: EdgeInsets.only(left: 15, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'รีวิว',
                            style: GoogleFonts.k2d(
                                color: Colors.white, fontSize: 12),
                          ),
                          Container(
                            child: FlatButton(
                              onPressed: () {},
                              child: Text(
                                "ดูทั้งหมด",
                                style: GoogleFonts.k2d(
                                  color: ColorTheme.gold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 10, top: 10, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/cat1.jpg"),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Container(
                            child: Expanded(
                                child: Container(
                                    child: Column(
                              children: [
                                Text(
                                  'The pages in this section contain recommendations on the best way to do code reviews, based on long experience. All together they represent one complete document, broken up into many separate sections. You don’t have to read them all, but many people have found it very helpful to',
                                  maxLines: 5,
                                  style: GoogleFonts.k2d(
                                      color: Colors.white, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ))),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        indent: 10,
                        endIndent: 10,
                        color: ColorTheme.firstTheme,
                        thickness: 1),
                    Container(
                      margin: EdgeInsets.only(
                          bottom: 10, top: 10, left: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                image: AssetImage("assets/cat1.jpg"),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.05,
                          ),
                          Container(
                            child: Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      'The pages in this section contain recommendations on the best way to do code reviews, based on long experience. All together they represent one complete document, broken up into many separate sections. You don’t have to read them all, but many people have found it very helpful to',
                                      maxLines: 5,
                                      style: GoogleFonts.k2d(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: ColorTheme.secondTheme,
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookQueue()),
            );
          },
          textColor: Colors.white,
          color: ColorTheme.gold,
          elevation: 10,
          child: Text(
            'จองห้องพัก',
            style: GoogleFonts.k2d(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
