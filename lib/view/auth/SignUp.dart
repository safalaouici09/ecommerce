import 'package:flutter/material.dart';
import 'package:shopy/Palette.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SignUp ! ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "create an acount so you can order your favorite products ",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                FormWidget(
                  text: "Email",
                  hintText: "safa@gmail.com",
                ),
                SizedBox(
                  height: 15,
                ),
                FormWidget(
                  text: "Password",
                  hintText: "**********",
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: null,
                  child: ColoredContainer(
                    text: "Register Now ",
                    color: Corange,
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Or continue with ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ColoredContainer(
                  text: "Google",
                  color: Colors.black45,
                  textColor: Colors.black,
                ),
                Text("already have an account ? login in ")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColoredContainer extends StatelessWidget {
  var color;
  var text;
  var textColor;
  var icon;
  ColoredContainer(
      {Key? key,
      this.text = "",
      this.color,
      this.textColor = Colors.white,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: textColor, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class FormWidget extends StatelessWidget {
  var text;
  var hintText;

  FormWidget({Key? key, this.text, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
                gapPadding: 2.0, borderRadius: BorderRadius.circular(15)),
            labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            ),
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
