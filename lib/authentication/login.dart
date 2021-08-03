import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leave_request/Home.dart';
import 'package:leave_request/components.dart';
import 'package:leave_request/authentication/register.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final formKey = GlobalKey<FormState>();
  String error = '';

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Stack(
            children: [
              TopBezier(),
              Center(
                child: logInForm(),
              )
            ],
          ),
        ),
        BottomBezier(),
      ],
    );
  }

  Widget logInForm() {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In',
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
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          FormError(error: error),
          SizedBox(height: 5),
          SubmitButton(
            label: 'Log In',
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
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Register',
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
