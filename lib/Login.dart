import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icarehotel/Clipper&Widget/Dialog.dart';
import 'package:icarehotel/Register.dart';
import 'package:icarehotel/mainpage.dart';
import 'package:image_slider/image_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'color.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TabController tabController;
  List<String> links = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg'
  ];
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  // Sign In Email
  Future<bool> signInWithEmail(BuildContext context,
      {@required String email, @required String password}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) {
      sharedPreferences.setString("uid", result.user.uid);
      print(result.user.uid);
      setState(() {});
      return true;
    }).catchError((e) {
      print(e);
      switch (e.code) {
        case "ERROR_WRONG_PASSWORD":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "Wrong Password! Try again.",
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
              description: "Email is not correct!, Try again",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_USER_NOT_FOUND":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "User not found! Register first!",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_USER_DISABLED":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description: "User has been disabled!, Try again",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description:
                  "Sign in disabled due to too many requests from this user!, Try again",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => CustomDialogAvatar(
              title: "ผิดพลาด",
              description:
                  "Operation not allowed!, Please enable it in the firebase console, Try again",
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
              description: "Unknown error",
              buttonText: "ตกลง",
              onPressed: () => Navigator.pop(context),
            ),
          );
      }
      return false;
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
              Container(
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/23183.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: size.height,
                margin: EdgeInsets.fromLTRB(0, size.height * 0.25, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: ColorTheme.firstTheme,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          "Welcome back",
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: size.height * 0.035,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Login to your Account",
                          style: GoogleFonts.k2d(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: size.height * 0.02,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              buildTextFieldEmail(),
                              buildTextFieldPassword(),
                              button(size.width * 0.9, () async {
                                if (email.text.isEmpty ||
                                    password.text.isEmpty) {
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
                                if (await signInWithEmail(context,
                                    email: email.text,
                                    password: password.text)) {
                                  return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogAvatar(
                                      title: "สำเร็จ",
                                      description: "เข้าสู่ระบบสำเร็จ!",
                                      buttonText: "ตกลง",
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder:
                                                        (BuildContext
                                                                context) =>
                                                            Mainpage()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                    ),
                                  );
                                } else {
                                  return showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogAvatar(
                                      title: "ผิดพลาด",
                                      description:
                                          "ล็อคอินไม่ถูกต้อง โปรดลองอีกครั้ง",
                                      buttonText: "ตกลง",
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  );
                                }
                              }, ColorTheme.gold, 'Login'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Divider(color: Colors.white),
                                  )),
                                  Text(
                                    'OR',
                                    style: GoogleFonts.k2d(
                                      fontSize: size.height * 0.018,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Divider(color: Colors.white),
                                  )),
                                ],
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    button(size.width * 0.38, () {},
                                        ColorTheme.facebook, 'Facebook'),
                                    button(size.width * 0.38, () {},
                                        ColorTheme.twitter, 'Twitter'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 50, 20, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: GoogleFonts.k2d(
                                fontSize: size.height * 0.013,
                                color: Colors.white,
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ),
                                );
                              },
                              textColor: ColorTheme.gold,
                              child: Text(
                                'Create an account',
                                style: GoogleFonts.k2d(
                                  fontSize: size.height * 0.022,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //),
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

  Container buildTextFieldEmail() {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 20),
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
            hintStyle: GoogleFonts.k2d(fontSize: size.height * 0.012),
            prefixIcon: Icon(
              Icons.email,
              color: ColorTheme.gold,
            ),
            labelStyle: GoogleFonts.k2d(fontSize: size.height * 0.012),
          ),
        ),
      ),
    );
  }

  Container buildTextFieldPassword() {
    final size = MediaQuery.of(context).size;
    return Container(
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
          controller: password,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            hintStyle: GoogleFonts.k2d(fontSize: size.height * 0.012),
            prefixIcon: Icon(
              Icons.vpn_key,
              color: ColorTheme.gold,
            ),
            labelStyle: GoogleFonts.k2d(fontSize: size.height * 0.012),
          ),
        ),
      ),
    );
  }

  Container button(width, onPressed, color, text) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.05,
      width: width,
      color: Colors.transparent,
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: onPressed,
        textColor: Colors.white,
        color: color,
        elevation: 10,
        child: Text(
          text,
          style: GoogleFonts.k2d(fontSize: size.height * 0.015),
        ),
      ),
    );
  }
}
