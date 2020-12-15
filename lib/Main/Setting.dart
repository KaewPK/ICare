import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/ChangePassword.dart';
import 'package:icarehotel/SubMain/Coupon.dart';
import 'package:icarehotel/SubMain/Profile.dart';
import 'package:icarehotel/SubMain/Promotion.dart';
import 'package:icarehotel/color.dart';
import 'package:icarehotel/Login.dart';
import 'package:icarehotel/shared/const.dart';
import 'package:system_setting/system_setting.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<String> language = <String>['Thai', 'English'];

  setLanguage() {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: ColorTheme.secondTheme,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: ColorTheme.secondTheme,
              height: size.height * 0.18,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Text(
                      'เปลี่ยนภาษา',
                      style: GoogleFonts.k2d(
                        fontSize: size.height * 0.018,
                        color: ColorTheme.gold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: language.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            print(language[index]);
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: ColorTheme.gold,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    language[index],
                                    style: GoogleFonts.k2d(
                                      fontSize: size.height * 0.015,
                                      color: ColorTheme.gold,
                                    ),
                                  ),
                                )
                              ],
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorTheme.secondTheme,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "ตั้งค่า",
          style: GoogleFonts.k2d(
            color: Colors.white,
            fontSize: size.height * 0.025,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        height: size.height * 0.9,
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  'โปรไฟล์',
                  style: GoogleFonts.k2d(color: Colors.white),
                ),
              ),
              (Const.uid == null)
                  ? buttonChoice(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                      Icon(Icons.lock_open, color: Colors.white), 'เข้าสู่ระบบ')
                  : Container(),
              (Const.uid == null)
                  ? Container()
                  : buttonChoice(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(),
                        ),
                      );
                    }, Icon(Icons.person, color: Colors.white), 'โปรไฟล์'),
              (Const.uid == null)
                  ? Container()
                  : buttonChoice(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChangePassword(),
                        ),
                      );
                    }, Icon(Icons.vpn_key, color: Colors.white),
                      'เปลี่ยนรหัสผ่าน'),
              (Const.uid == null)
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        'สิทธิประโยชน์',
                        style: GoogleFonts.k2d(color: Colors.white),
                      ),
                    ),
              (Const.uid == null)
                  ? Container()
                  : buttonChoice(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Coupon(),
                        ),
                      );
                    }, Icon(Icons.confirmation_number, color: Colors.white),
                      'คูปอง'),
              (Const.uid == null)
                  ? Container()
                  : buttonChoice(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Promotion(),
                        ),
                      );
                    }, Icon(Icons.redeem, color: Colors.white), 'โปรโมชั่น'),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  'ตั้งค่า',
                  style: GoogleFonts.k2d(color: Colors.white),
                ),
              ),
              buttonChoice(() => setLanguage(),
                  Icon(Icons.language, color: Colors.white), 'ภาษา'),
              buttonChoice(
                  () => SystemSetting.goto(SettingTarget.NOTIFICATION),
                  Icon(Icons.notifications, color: Colors.white),
                  'การแจ้งเตือน'),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                child: Text(
                  'ติดต่อเรา',
                  style: GoogleFonts.k2d(color: Colors.white),
                ),
              ),
              buttonChoice(() {}, Icon(Icons.help, color: Colors.white),
                  'ขอความช่วยเหลือ'),
              buttonChoice(() {}, Icon(Icons.people, color: Colors.white),
                  'เกี่ยวกับเรา'),
              (Const.uid == null)
                  ? Container()
                  : buttonChoice(() {
                      Const.logoutAndRemoveValue(context);
                    }, Icon(Icons.people, color: Colors.white), 'ออกจากระบบ'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttonChoice(onTap, icon, text) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: ColorTheme.secondTheme,
          ),
          height: size.height * 0.08,
          child: Row(
            children: [
              icon,
              Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text(
                  text,
                  style: GoogleFonts.k2d(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
