import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/SubMain/CheckInDetail.dart';
import 'package:icarehotel/color.dart';

class CheckIn extends StatefulWidget {
  CheckIn({Key key}) : super(key: key);

  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
  final List<String> imgbooking = <String>[
    'assets/roomType/img1.jpg',
    'assets/roomType/img1.jpg',
  ];
  final List<String> booking = <String>[
    'Standard Room',
    'Deluxe Room',
  ];
  final List<String> bookingmoney = <String>[
    '฿ 1,213.00',
    '฿ 2,157.00',
  ];
  final List<String> bookingStatus = <String>[
    'รอเช็คอินเข้าพัก',
    'รอเช็คอินเข้าพัก',
  ];
  final List<String> bookingDateCheckIn = <String>[
    '2020-10-08',
    '2020-10-09',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.secondTheme,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "เช็คอิน",
          style: GoogleFonts.k2d(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: ColorTheme.firstTheme,
        ),
        child: Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: booking.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckInDetail()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorTheme.secondTheme,
                    ),
                    height: size.height * 0.15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              imgbooking[index],
                              height: size.height * 0.12,
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              booking[index],
                              style: GoogleFonts.k2d(
                                fontSize: size.height * 0.018,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'ราคา : ${bookingmoney[index]}',
                              style: GoogleFonts.k2d(
                                fontSize: size.height * 0.015,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'วันเข้าพัก : ${bookingDateCheckIn[index]}',
                              style: GoogleFonts.k2d(
                                fontSize: size.height * 0.013,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              bookingStatus[index],
                              style: GoogleFonts.k2d(
                                color: Colors.green,
                                fontSize: size.height * 0.015,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
