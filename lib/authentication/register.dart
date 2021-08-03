import 'package:flutter/material.dart';
import 'package:leave_request/Home.dart';
import 'package:leave_request/components.dart';

import 'login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String error = '';

  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              TopBezier(),
              Center(child: resisterForm()),
            ],
          ),
        ),
        BottomBezier(),
      ],
    );
  }
  Widget resisterForm() {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Register',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(
            height: 15,
          ),
          Form(
            key: formKey,
            child: Column(
              children: [
                EntryField(
                  title: 'UserName',
                  controller: userNameController,
                  err: 'Enter your Username',
                  type: TextInputType.emailAddress,
                  isPassword: false,
                  icon: Icons.person_outline,
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  title: 'Email',
                  controller: emailController,
                  err: 'Enter email',
                  type: TextInputType.emailAddress,
                  isPassword: false,
                  icon: Icons.mail_outline,
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  title: 'Password',
                  controller: passwordController,
                  err: 'Enter Password',
                  type: TextInputType.text,
                  isPassword: true,
                  icon: Icons.vpn_key_outlined,
                  // suffixIcon: Icons.remove_red_eye_outlined,
                ),
                SizedBox(
                  height: 12,
                ),
                EntryField(
                  title: 'Confirm Password',
                  controller: confirmPasswordController,
                  err: 'Enter Password',
                  type: TextInputType.text,
                  isPassword: true,
                  icon: Icons.vpn_key_outlined,
                  // suffixIcon: Icons.remove_red_eye_outlined,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          FormError(error: error),
          SizedBox(height: 5),
          SubmitButton(
            label: 'Register',
            onTap: () {
              //check passwords match, else error
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          CustomDivider(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Log In',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
