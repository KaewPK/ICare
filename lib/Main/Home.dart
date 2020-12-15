import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/Clipper&Widget/Text.dart';
import 'package:icarehotel/SubMain/RoomDetail.dart';
import 'package:icarehotel/color.dart';
import 'package:image_slider/image_slider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  List<String> links = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg'
  ];
  List<String> recommend = <String>['Superior Room', 'Deluxe Room'];
  List<String> recommendPrice = <String>['฿ 1,875.00', '฿ 2,157.00'];
  List<String> imgrecommend = <String>[
    'assets/recommend/img1.jpg',
    'assets/recommend/img2.jpg'
  ];
  List<String> roomType = <String>[
    'Superior Room',
    'Deluxe Room',
    'Standard Room',
  ];
  List<String> imgroomType = <String>[
    'assets/roomType/img1.jpg',
    'assets/roomType/img2.jpg',
    'assets/roomType/img3.jpg'
  ];
  List<String> priceType = <String>['฿ 1,875.00', '฿ 2,157.00', '฿ 1,213.00'];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        color: ColorTheme.firstTheme,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Check in Date - Check out Date',
                    hintStyle:
                        GoogleFonts.k2d(fontSize: 13, color: Colors.black45),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.date_range),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return ImageSlider(
                      showTabIndicator: true,
                      tabIndicatorColor: ColorTheme.secondTheme,
                      tabIndicatorSelectedColor: ColorTheme.gold,
                      tabIndicatorHeight: 10,
                      tabIndicatorSize: 10,
                      tabController: tabController,
                      curve: Curves.slowMiddle,
                      width: MediaQuery.of(context).size.width,
                      height: size.height * 0.25,
                      autoSlide: true,
                      duration: new Duration(seconds: 8),
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
                    );
                  } else if (index == 1)
                    return TextTitle(
                      text: 'Recommend',
                      style: GoogleFonts.k2d(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    );
                  else if (index == 2) {
                    return recommandCard();
                  } else if (index == 3) {
                    return TextTitle(
                      text: 'Our Room',
                      style: GoogleFonts.k2d(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    );
                  } else if (index == 4) {
                    return roomTypeCard();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget recommandCard() {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recommend.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RoomDetail(
                    typename: recommend[index],
                  ),
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: [
                    Container(
                      child: Image.asset(
                        imgrecommend[index],
                        fit: BoxFit.cover,
                      ),
                      height: size.height * 0.15,
                      width: size.width * 0.46,
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      width: size.width * 0.46,
                      height: 60.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.1)
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              child: Text(
                                recommend[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RatingBarIndicator(
                                  rating: 3,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 10.0,
                                  unratedColor: Colors.amber.withAlpha(20),
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  recommendPrice[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget roomTypeCard() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(bottom: size.height * 0.125),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: roomType.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height * 0.2,
                      child: Image.asset(
                        imgroomType[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      width: size.width,
                      height: 60.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.1)
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                  20, 0, size.width * 0.42, 0),
                              child: Text(
                                roomType[index],
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                RatingBarIndicator(
                                  rating: 3,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 10.0,
                                  unratedColor: Colors.amber.withAlpha(20),
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  priceType[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
