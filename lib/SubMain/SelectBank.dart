import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/SubMain/Payment.dart';
import 'package:icarehotel/color.dart';
import 'package:icarehotel/mainpage.dart';

class BankSelect extends StatefulWidget {
  @override
  _BankSelectState createState() => _BankSelectState();
}

class _BankSelectState extends State<BankSelect> {
  final List<String> imgbank = <String>[
    'assets/bank/SCB.png',
    'assets/bank/GSB.png',
    'assets/bank/KBANK.png'
  ];
  final List<String> bank = <String>[
    'ธนาคารไทยพาณิชย์',
    'ธนาคารออมสิน',
    'ธนาคารกสิกรไทย'
  ];
  @override
  void initState() {
    super.initState();
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
          },
        ),
        title: Text("เลือกธนาคารในการชำระเงิน", style: GoogleFonts.k2d()),
        backgroundColor: ColorTheme.firstTheme,
        elevation: 0.0,
      ),
      body: Container(
        color: ColorTheme.secondTheme,
        child: Container(
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            itemCount: bank.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Payment()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorTheme.firstTheme,
                    ),
                    height: size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(imgbank[index]),
                        Text(
                          bank[index],
                          style: GoogleFonts.k2d(color: Colors.white),
                        ),
                        Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              indent: 10,
              endIndent: 10,
              color: ColorTheme.gold,
              thickness: 2,
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
              MaterialPageRoute(builder: (context) => Mainpage()),
            );
          },
          textColor: Colors.white,
          color: ColorTheme.gold,
          elevation: 10,
          child: Text(
            'ชำระเงินในภายหลัง',
            style: GoogleFonts.k2d(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
