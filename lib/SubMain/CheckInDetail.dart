import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/color.dart';
import 'package:jiffy/jiffy.dart';

class CheckInDetail extends StatefulWidget {
  CheckInDetail({Key key}) : super(key: key);

  @override
  _CheckInDetailState createState() => _CheckInDetailState();
}

class _CheckInDetailState extends State<CheckInDetail> {
  final fristname = TextEditingController();
  final lastname = TextEditingController();
  final dathOfBirth = TextEditingController();
  final career = TextEditingController();
  final nationality = TextEditingController();
  final currentAddress = TextEditingController();
  final phoneNumber = TextEditingController();
  final comeFrom = TextEditingController();
  final goingTo = TextEditingController();
  final iDCardNumber = TextEditingController();
  final iDCardIssuedBy = TextEditingController();
  final iDCardIssueDate = TextEditingController();
  final iDCardExpiredCard = TextEditingController();
  final alienNo = TextEditingController();
  final alienIssuedBy = TextEditingController();
  final passportNo = TextEditingController();
  final passportIssuedBy = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: ColorTheme.secondTheme,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              "กรอกข้อมูลเข้าพัก",
              style: GoogleFonts.k2d(
                color: Colors.white,
                fontSize: size.height * 0.025,
              ),
            ),
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: ColorTheme.firstTheme,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textdetail('ชื่อ', fristname, TextInputType.text, 1),
                  textdetail('นามสกุล', lastname, TextInputType.text, 1),
                  textdetail(
                      'วัน/เดือน/ปี เกิด', dathOfBirth, TextInputType.text, 1),
                  textdetail(
                      'เบอร์โทรศัพท์', phoneNumber, TextInputType.text, 1),
                  textdetail('อาชีพ', career, TextInputType.text, 1),
                  textdetail('สัญชาติ', nationality, TextInputType.text, 1),
                  textdetail('ที่อยู่', currentAddress, TextInputType.text, 1),
                  textdetail(
                      'เลขบัตรประชาชน', iDCardNumber, TextInputType.text, 1),
                  textdetail(
                      'ออกให้โดย', iDCardIssuedBy, TextInputType.text, 1),
                  textdetail(
                      'วันออกบัตร', iDCardIssueDate, TextInputType.text, 1),
                  textdetail(
                      'บัตรหมดอายุ', iDCardExpiredCard, TextInputType.text, 1),
                  textdetail(
                      'เลขประจำตัวต่างด้าว', alienNo, TextInputType.text, 1),
                  textdetail('ออกให้โดย', alienIssuedBy, TextInputType.text, 1),
                  textdetail('หนังสือเดินทางเลขที่', passportNo,
                      TextInputType.text, 1),
                  textdetail(
                      'ออกให้โดย', passportIssuedBy, TextInputType.text, 1),
                  textdetail('มาจาก', comeFrom, TextInputType.text, 1),
                  textdetail('จะไปที่', goingTo, TextInputType.text, 1),
                  Container(
                    width: size.width,
                    color: Colors.transparent,
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: ColorTheme.gold,
                      elevation: 10,
                      child: Text(
                        'ส่ง',
                        style: GoogleFonts.k2d(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textdetail(String title, TextEditingController textfiledcontroller,
      TextInputType keyboardType, int maxLength) {
    Size size = MediaQuery.of(context).size;
    return (textfiledcontroller.text == "-")
        ? Container()
        : Padding(
            padding: EdgeInsets.only(
                left: size.width / 20,
                right: size.width / 20,
                bottom: size.height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$title : ',
                  style: GoogleFonts.k2d(
                      fontSize: size.height * 0.015, color: Colors.white),
                ),
                Container(
                  child: TextField(
                    controller: textfiledcontroller,
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.multiline,
                    //maxLength: maxLength,
                    style: GoogleFonts.k2d(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                    ),
                    decoration: InputDecoration(
                      hintStyle: GoogleFonts.k2d(
                        color: Colors.white,
                        fontSize: size.height * 0.02,
                      ),
                      labelStyle: GoogleFonts.k2d(
                        color: Colors.white,
                        fontSize: size.height * 0.02,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: size.height * 0.03,
                      ),
                      focusColor: Colors.white,
                      filled: false,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
