import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/color.dart';
import 'package:icarehotel/mainpage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final date = TextEditingController();
  final money = TextEditingController();
  final banknum = TextEditingController();
  DateTime selectedDate = DateTime.now();
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: Jiffy().add(years: 5),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        date.text = "${picked.toLocal()}".split(' ')[0];
      });
  }

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
  }

  Widget showImage() {
    final size = MediaQuery.of(context).size;
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Container(
            height: size.height * 0.3,
            child: Image.file(
              snapshot.data,
              fit: BoxFit.contain,
            ),
          );
        } else if (null != snapshot.error) {
          return Container(
            margin: const EdgeInsets.all(10),
            height: size.height * 0.2,
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: Center(
              child: const Text(
                'Error Picking Image',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        } else {
          return InkWell(
            onTap: chooseImage,
            child: Container(
              margin: const EdgeInsets.all(10),
              height: size.height * 0.2,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: Center(
                child: Icon(
                  Icons.add_a_photo,
                  color: Colors.white,
                  size: size.height * 0.05,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.secondTheme,
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
        title: Text("ชำระเงิน", style: GoogleFonts.k2d()),
        backgroundColor: ColorTheme.firstTheme,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: ColorTheme.secondTheme,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                decoration: BoxDecoration(
                  color: ColorTheme.firstTheme,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดชำระเงินทั้งหมด',
                          style: GoogleFonts.k2d(
                              color: Colors.white,
                              fontSize: size.height * 0.02),
                        ),
                        Text(
                          '฿ 1,875.00',
                          style: GoogleFonts.k2d(
                              color: Colors.red, fontSize: size.height * 0.02),
                        ),
                      ],
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                      color: ColorTheme.gold,
                      thickness: 1,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'รายละเอียดการชำระเงิน',
                        style: GoogleFonts.k2d(
                            color: Colors.white, fontSize: size.height * 0.02),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                      padding: const EdgeInsets.all(10),
                      width: size.width * 0.85,
                      decoration: BoxDecoration(
                        color: ColorTheme.gold,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'โอนผ่านธนาคาร',
                                style: GoogleFonts.k2d(color: Colors.white),
                              ),
                              Text(
                                'ไทยพาณิชย์',
                                style: GoogleFonts.k2d(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'เลขบัญชี',
                                style: GoogleFonts.k2d(color: Colors.white),
                              ),
                              Text(
                                'xxx-xxxxxx-x',
                                style: GoogleFonts.k2d(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ชื่อบัญชี',
                                style: GoogleFonts.k2d(color: Colors.white),
                              ),
                              Text(
                                'iCare Residence & Hotel',
                                style: GoogleFonts.k2d(color: Colors.white),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'อัพโหลดหลักฐานการชำระเงิน',
                        style: GoogleFonts.k2d(
                            color: Colors.white, fontSize: size.height * 0.02),
                      ),
                    ),
                    showImage(),
                    SizedBox(height: size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'วันที่โอนเงินตามหลักฐาน :',
                          style: GoogleFonts.k2d(
                              color: ColorTheme.gold,
                              fontSize: size.height * 0.015),
                        ),
                        Container(
                          width: size.width * 0.5,
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
                              controller: date,
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  selectDate(context);
                                });
                              },
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
                                hintText: "Select Date",
                                hintStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
                                suffixIcon: Icon(Icons.date_range,
                                    color: ColorTheme.gold),
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
                          'จำนวนเงินถูกโอนแล้ว(฿) :',
                          style: GoogleFonts.k2d(
                              color: ColorTheme.gold,
                              fontSize: size.height * 0.015),
                        ),
                        Container(
                          width: size.width * 0.5,
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
                              controller: money,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
                                hintStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
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
                          'โอนเงินจากบัญชีธนาคาร(4หลักสุดท้าย) :',
                          style: GoogleFonts.k2d(
                              color: ColorTheme.gold,
                              fontSize: size.height * 0.015),
                        ),
                        Container(
                          width: size.width * 0.25,
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
                              controller: banknum,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
                                hintText: '1234',
                                hintStyle: GoogleFonts.k2d(
                                    fontSize: size.height * 0.012),
                              ),
                            ),
                          ),
                        ),
                      ],
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
            openDialog();
          },
          textColor: Colors.white,
          color: ColorTheme.gold,
          elevation: 10,
          child: Text(
            'ส่ง',
            style: GoogleFonts.k2d(fontSize: 15),
          ),
        ),
      ),
    );
  }

  void openDialog() {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) => dialogComplete()));
  }

  Widget dialogComplete() {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.secondTheme.withOpacity(0.3),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon(
              AssetImage('assets/like.png'),
              color: Colors.white,
              size: size.height * 0.17,
            ),
            Container(
              margin: EdgeInsets.only(top: size.height * 0.05),
              child: Center(
                  child: Material(
                child: Text(
                  "ขอบคุณที่ใช้บริการจองห้องพัก",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue.withOpacity(0.0),
              )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorTheme.gold,
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Mainpage()),
                  );
                },
                child: Text(
                  "กลับสู่หน้าหลัก",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
