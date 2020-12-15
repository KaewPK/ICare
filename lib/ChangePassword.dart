import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/color.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
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
              "เปลี่ยนรหัสผ่าน",
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ColorTheme.gold,
                        ),
                      ),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                          prefixIcon: Icon(
                            Icons.email,
                            color: ColorTheme.gold,
                          ),
                          labelStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ColorTheme.gold,
                        ),
                      ),
                      child: TextFormField(
                        controller: email,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: ColorTheme.gold,
                          ),
                          labelStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: ColorTheme.gold,
                        ),
                      ),
                      child: TextFormField(
                        controller: email,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          hintStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                          prefixIcon: Icon(
                            Icons.vpn_key,
                            color: ColorTheme.gold,
                          ),
                          labelStyle:
                              GoogleFonts.k2d(fontSize: size.height * 0.012),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                    margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: RaisedButton(
                      onPressed: () {},
                      textColor: Colors.white,
                      color: ColorTheme.gold,
                      elevation: 10,
                      child: Text(
                        'ยืนยัน',
                        style: GoogleFonts.k2d(fontSize: size.height * 0.015),
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
}
