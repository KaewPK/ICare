import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/Clipper&Widget/Dialog.dart';
import 'package:icarehotel/color.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  registerWithEmail(
      {@required email, @required password, @required repassword}) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("Sign up user successful.");
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CustomDialogAvatar(
          title: "สำเร็จ",
          description: "ลงทะเบียนสำเร็จ โปรดกลับไปหน้าล็อกอิน",
          buttonText: "ตกลง",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }).catchError((e) {
      print(e);
      switch (e.code) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Anonymous accounts are not enabled",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_WEAK_PASSWORD":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Your password is too weak",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_INVALID_EMAIL":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Your email is invalid",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Email is already in use on different account",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_INVALID_CREDENTIAL":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Your email is invalid",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        default:
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "An undefined Error happened.",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: ColorTheme.firstTheme,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, size.height * 0.1, 0, 0),
                      height: size.height * 0.15,
                      width: size.width,
                      child: Center(
                        child: Text(
                          "Create an account",
                          style: GoogleFonts.sansita(
                            fontSize: size.height * 0.045,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, size.height * 0.1),
                      width: size.width,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: size.width * 0.9,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
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
                                      hintStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                      prefixIcon: Icon(
                                        Icons.email,
                                        color: ColorTheme.gold,
                                      ),
                                      labelStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ColorTheme.gold,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: password,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        color: ColorTheme.gold,
                                      ),
                                      labelStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: size.width * 0.9,
                                child: Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 20, 20, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: ColorTheme.gold,
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: confirmPassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      hintText: 'Confirm-Password',
                                      hintStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                      prefixIcon: Icon(
                                        Icons.vpn_key,
                                        color: ColorTheme.gold,
                                      ),
                                      labelStyle: GoogleFonts.k2d(
                                          fontSize: size.height * 0.012),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: size.height * 0.05,
                            width: size.width * 0.8,
                            color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(
                                0, size.height * 0.08, 0, 0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              onPressed: () async {
                                if (email.text == "" ||
                                    password.text == "" ||
                                    confirmPassword.text == "") {
                                  return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogAvatar(
                                      title: "ผิดพลาด",
                                      description: "โปรดกรอกข้อมูลให้ครบถ้วน",
                                      buttonText: "ตกลง",
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  );
                                }
                                if (password.text.length <= 6 ||
                                    confirmPassword.text.length <= 6) {
                                  return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogAvatar(
                                      title: "ผิดพลาด",
                                      description:
                                          "รหัสผ่านต้องมากกว่า 6 ตัวขึ้นไป",
                                      buttonText: "ตกลง",
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  );
                                }
                                if (password.text != confirmPassword.text) {
                                  return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogAvatar(
                                      title: "ผิดพลาด",
                                      description:
                                          "รหัสผ่านกับรหัสยืนยันไม่ตรงกัน",
                                      buttonText: "ตกลง",
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  );
                                }
                                registerWithEmail(
                                  email: email.text,
                                  password: password.text,
                                  repassword: confirmPassword.text,
                                );
                                // if (chksignup == true) {
                                //   showDialog(
                                //     barrierDismissible: false,
                                //     context: context,
                                //     builder: (BuildContext context) =>
                                //         CustomDialogAvatar(
                                //       title: "สำเร็จ",
                                //       description: "ลงทะเบียนสำเร็จ",
                                //       buttonText: "ตกลง",
                                //       onPressed: () {
                                //         Navigator.pop(context);
                                //         Navigator.pop(context);
                                //       },
                                //     ),
                                //   );
                                // }
                              },
                              textColor: Colors.white,
                              color: ColorTheme.gold,
                              elevation: 10,
                              child: Text(
                                'Sign Up',
                                style: GoogleFonts.k2d(
                                    fontSize: size.height * 0.015),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: size.height * 0.05),
                            child: Column(
                              children: [
                                Text(
                                  "By click Sign up you agree to the following",
                                  style: GoogleFonts.k2d(
                                    color: Colors.white,
                                    fontSize: size.height * 0.013,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FlatButton(
                                      onPressed: () {},
                                      textColor: Colors.white,
                                      child: Text(
                                        'Terms and Conditions',
                                        style: GoogleFonts.k2d(
                                          fontSize: size.height * 0.015,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "without reservation",
                                      style: GoogleFonts.k2d(
                                        color: Colors.white,
                                        fontSize: size.height * 0.013,
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
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
