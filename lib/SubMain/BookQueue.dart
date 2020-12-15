import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/SubMain/SelectBank.dart';
import 'package:icarehotel/color.dart';
import 'package:jiffy/jiffy.dart';

class BookQueue extends StatefulWidget {
  @override
  _BookQueueState createState() => _BookQueueState();
}

class _BookQueueState extends State<BookQueue> {
  final checkIn = TextEditingController();
  final checkOut = TextEditingController();
  final adult = TextEditingController();
  final child = TextEditingController();
  final room = TextEditingController();
  final name = TextEditingController();
  final mail = TextEditingController();
  final phone = TextEditingController();
  DateTime selectedDate = DateTime.now();

  selectDateCheckIn(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: Jiffy().add(years: 5),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        //selectedDate = picked;
        checkIn.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  selectDateCheckOut(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: Jiffy().add(years: 5),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        checkOut.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  defaulttext() {
    if (adult.text == "" || child.text == "" || room.text == "") {
      setState(() {
        adult.text = "1";
        child.text = "0";
        room.text = "1";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    defaulttext();
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
        title: Text("จองห้องพัก", style: GoogleFonts.k2d()),
        backgroundColor: ColorTheme.firstTheme,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorTheme.firstTheme,
          child: Container(
            height: size.height * 0.84,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              color: ColorTheme.secondTheme,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: size.height * 0.03),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'โปรดเลือกวันจองห้องพัก',
                    style: GoogleFonts.k2d(
                        color: Colors.white, fontSize: size.height * 0.02),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Check-In',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.65,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: checkIn,
                          readOnly: true,
                          onTap: () {
                            setState(() {
                              selectDateCheckIn(context);
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintText: "Select Date",
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            suffixIcon:
                                Icon(Icons.date_range, color: ColorTheme.gold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Check-Out',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.65,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: checkOut,
                          readOnly: true,
                          onTap: () {
                            setState(() {
                              selectDateCheckOut(context);
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintText: "Select Date",
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            suffixIcon:
                                Icon(Icons.date_range, color: ColorTheme.gold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: ColorTheme.gold,
                  thickness: 1,
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ข้อมูลผู้เข้าพัก',
                    style: GoogleFonts.k2d(
                        color: Colors.white, fontSize: size.height * 0.02),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ผู้ใหญ่ : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: adult,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'เด็ก : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.3,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: child,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'จำนวนห้อง : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.65,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: room,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.01),
                Divider(
                  indent: 10,
                  endIndent: 10,
                  color: ColorTheme.gold,
                  thickness: 1,
                ),
                SizedBox(height: size.height * 0.01),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'ข้อมูลการติดต่อ',
                    style: GoogleFonts.k2d(
                        color: Colors.white, fontSize: size.height * 0.02),
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ชื่อ-นามสกุล : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.6,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'E-mail : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.65,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: mail,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'เบอร์โทร : ',
                      style: GoogleFonts.k2d(
                          color: ColorTheme.gold,
                          fontSize: size.height * 0.018),
                    ),
                    Container(
                      width: size.width * 0.65,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: ColorTheme.gold,
                          ),
                        ),
                        child: TextFormField(
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                            hintStyle:
                                GoogleFonts.k2d(fontSize: size.height * 0.012),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
              MaterialPageRoute(builder: (context) => BankSelect()),
            );
          },
          textColor: Colors.white,
          color: ColorTheme.gold,
          elevation: 10,
          child: Text(
            'ยืนยันการจองห้องพัก',
            style: GoogleFonts.k2d(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
