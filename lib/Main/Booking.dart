import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/SubMain/SelectBank.dart';
import 'package:icarehotel/color.dart';

class Booking extends StatefulWidget {
  Booking({Key key}) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final List<String> imgbooking = <String>['assets/roomType/img1.jpg'];
  final List<String> booking = <String>['Superior Room'];
  final List<String> bookingmoney = <String>['฿ 1,875.00'];
  final List<String> bookingStatus = <String>['รอชำระเงิน'];
  final List<String> bookingDateCheckIn = <String>['2020-10-10'];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.secondTheme,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "จองห้องพัก",
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
                      MaterialPageRoute(builder: (context) => BankSelect()),
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
                                color: Colors.red,
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
