import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/color.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController fristname,
      lastname,
      dathOfBirth,
      phoneNumber,
      career,
      nationality,
      currentAddress,
      iDCardNumber,
      iDCardIssuedBy,
      iDCardIssueDate,
      iDCardExpiredCard,
      alienNo,
      alienIssuedBy,
      passportNo,
      passportIssuedBy;
  bool editing;

  @override
  void initState() {
    fristname = TextEditingController(text: 'Gustav');
    lastname = TextEditingController(text: 'Purpleson');
    dathOfBirth = TextEditingController(text: '2013/10/10');
    phoneNumber = TextEditingController(text: '0888547892');
    career = TextEditingController(text: 'โปรแกรมเมอร์');
    nationality = TextEditingController(text: 'ไทย');
    currentAddress =
        TextEditingController(text: '33 อำเภอบางกระสอ จังหวัดนนทบุรี');
    iDCardNumber = TextEditingController(text: '1103752478598');
    iDCardIssuedBy = TextEditingController(text: 'อำเภอ');
    iDCardIssueDate = TextEditingController(text: '2013/10/10');
    iDCardExpiredCard = TextEditingController(text: '-');
    alienNo = TextEditingController(text: '-');
    alienIssuedBy = TextEditingController(text: '-');
    passportNo = TextEditingController(text: '-');
    passportIssuedBy = TextEditingController(text: '-');
    editing = false;
    super.initState();
  }

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
              "โปรไฟล์",
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
            actions: [
              editing == false
                  ? IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        setState(() {
                          editing = true;
                        });
                      },
                    )
                  : Container()
            ],
          ),
          body: Container(
            height: size.height,
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Center(
                      child: CircleAvatar(
                        radius: size.height * 0.09,
                        backgroundImage: AssetImage('assets/Logo.png'),
                        foregroundColor: ColorTheme.gold,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: editing == true
                              ? CircleAvatar(
                                  backgroundColor: ColorTheme.firstTheme,
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: size.height * 0.03,
                                  ),
                                )
                              : Center(),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: size.height / 40,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textdetail(
                            'ชื่อ', fristname, editing, TextInputType.text, 1),
                        textdetail('นามสกุล', lastname, editing,
                            TextInputType.text, 1),
                        textdetail('วัน/เดือน/ปี เกิด', dathOfBirth, editing,
                            TextInputType.text, 1),
                        textdetail('เบอร์โทรศัพท์', phoneNumber, editing,
                            TextInputType.text, 1),
                        textdetail(
                            'อาชีพ', career, editing, TextInputType.text, 1),
                        textdetail('สัญชาติ', nationality, editing,
                            TextInputType.text, 1),
                        textdetail('ที่อยู่', currentAddress, editing,
                            TextInputType.multiline, 3),
                        textdetail('เลขบัตรประชาชน', iDCardNumber, editing,
                            TextInputType.text, 1),
                        textdetail('ออกให้โดย', iDCardIssuedBy, editing,
                            TextInputType.text, 1),
                        textdetail('วันออกบัตร', iDCardIssueDate, editing,
                            TextInputType.text, 1),
                        textdetail('บัตรหมดอายุ', iDCardExpiredCard, editing,
                            TextInputType.text, 1),
                        textdetail('เลขประจำตัวต่างด้าว', alienNo, editing,
                            TextInputType.text, 1),
                        textdetail('ออกให้โดย', alienIssuedBy, editing,
                            TextInputType.text, 1),
                        textdetail('หนังสือเดินทางเลขที่', passportNo, editing,
                            TextInputType.text, 1),
                        textdetail('ออกให้โดย', passportIssuedBy, editing,
                            TextInputType.text, 1),
                        editing == true
                            ? Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width / 20,
                                    right: size.width / 20,
                                    bottom: size.height * 0.02),
                                width: size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorTheme.email),
                                child: FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      editing = false;
                                    });
                                  },
                                  child: Text(
                                    "บันทึกข้อมูล",
                                    style: GoogleFonts.k2d(
                                        color: Colors.white,
                                        fontSize: size.height * 0.02),
                                  ),
                                ),
                              )
                            : Center(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget textdetail(String title, TextEditingController textfiledcontroller,
      bool edit, TextInputType keyboardType, int maxLength) {
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
                    maxLength: maxLength,
                    style: GoogleFonts.k2d(
                      color: Colors.white,
                      fontSize: size.height * 0.02,
                    ),
                    decoration: InputDecoration(
                        hintStyle: GoogleFonts.k2d(
                          color: Colors.white,
                          fontSize: size.height * 0.02,
                        ),
                        counterText: "",
                        labelStyle: GoogleFonts.k2d(
                          color: Colors.white,
                          fontSize: size.height * 0.02,
                        ),
                        suffixIcon: editing == true
                            ? Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: size.height * 0.03,
                              )
                            : null,
                        focusColor: Colors.white,
                        filled: false,
                        enabled: edit,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          );
  }
}
