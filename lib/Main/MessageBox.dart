import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/color.dart';

class MessageBox extends StatefulWidget {
  MessageBox({Key key}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final List<String> imgbank = <String>[
    'assets/bank/SCB.png',
    'assets/bank/BBL.png',
    'assets/bank/KTB.png',
    'assets/bank/KBANK.png'
  ];
  final List<String> bank = <String>[
    'ธนาคารไทยพาณิชย์',
    'ธนาคารกรุงเทพ',
    'ธนาคารกรุงไทย',
    'ธนาคารกสิกรไทย'
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
          "ข้อความ",
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
      ),
    );
  }
}
