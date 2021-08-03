import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'BezierCurves.dart';

class TopBezier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -220,
      left: 0,
      right: -290,
      child: Transform(
        transform: Matrix4.rotationZ(100),
        alignment: FractionalOffset.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CircleOne(),
                CircleTwo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBezier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [WavyFooter(), CircleOne(), CircleTwo()],
        ),
      ],
    );
  }
}

class FormError extends StatelessWidget {
  final String error;

  FormError({Key key, this.error});

  @override
  Widget build(BuildContext context) {
    return error == ''
        ? SizedBox(
            height: 1,
          )
        : Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            child: Text(
              '$error 😐😐',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
            ),
          );
  }
}

class EntryField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String err;
  final TextInputType type;
  final bool isPassword;
  final icon;
  final suffixIcon;
  final Color borderColor;
  final onChanged;
  final enabled;
  final validator;

  EntryField(
      {Key key,
      this.title,
      this.controller,
      this.err,
      this.type,
      this.isPassword,
      this.icon,
      this.suffixIcon,
      this.borderColor,
      this.onChanged,
      this.enabled,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: type,
        validator:
            validator == null ? (val) => val.isEmpty ? err : null : validator,
        controller: controller,
        obscureText: isPassword,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
            // hintText: title,
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).backgroundColor,
            ),
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: () {},
                    child: Icon(
                      suffixIcon,
                      color: Theme.of(context).backgroundColor,
                    ),
                  )
                : null,
            labelText: title,
            labelStyle: TextStyle(color: Theme.of(context).backgroundColor),
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).backgroundColor, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: borderColor == null
                      ? Theme.of(context).backgroundColor
                      : borderColor,
                  width: 1.0),
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(8),
            //   borderSide: BorderSide(
            //       color: Theme.of(context).backgroundColor, width: 1.0),
            // ),
            fillColor: Theme.of(context).scaffoldBackgroundColor,
            filled: true));
  }
}

class SubmitButton extends StatelessWidget {
  final Function onTap;
  final String label;
  final color;

  SubmitButton({Key key, this.onTap, this.label, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () async {
      //   if (formKey.currentState.validate()) {
      //     String email = emailController.text;
      //     String password = passwordController.text;
      //
      //     dynamic result = await APICalls().signInEmployee(email, password);

      //     if (result == null) {
      //       setState(() {
      //         error = 'Could not sign in..';
      //       });
      //     }
      //   }
      // },
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: color == null ? Theme.of(context).buttonColor : color,
        ),
        height: 42,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle2,
          )),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text(
            'or',
            style: Theme.of(context).textTheme.headline2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  final icon;
  final Function onPressed;

  AppBarIcon({Key key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      margin: EdgeInsets.only(top: 0, left: 9, right: 0),
      onPressed: onPressed,
      padding: const EdgeInsets.all(12.0),
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        depth: -3,
        intensity: 0.8,
        color: Theme.of(context).primaryColor,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class ClickableAvatar extends StatelessWidget {
  final icon;
  final Function onPressed;

  ClickableAvatar({Key key, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -3,
          boxShape: NeumorphicBoxShape.circle(),
          border: NeumorphicBorder(color: Colors.white.withAlpha(20)),
          color: Theme.of(context).scaffoldBackgroundColor,
          lightSource: LightSource.topLeft,
          shadowLightColor: Theme.of(context).scaffoldBackgroundColor,
          intensity: 0.9,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 80,
            width: 80,
            child: Center(
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final icon;
  final onPressed;

  MyAppBar({Key key, this.title, this.icon, this.onPressed});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: AppBarIcon(
        icon: icon == null ? Icons.arrow_back : icon,
        onPressed: onPressed == null
            ? () {
                Navigator.of(context).pop();
              }
            : onPressed,
      ),
    );
  }
}

class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;
  final Function onIconTapToOpenDrawer;
  final Function onIconTapToCloseDrawer;
  final bool isDrawerOpen;
  final themeOnPressed;
  final themeIcon;

  MainPageAppBar(
      {Key key,
      this.title,
      this.isDrawerOpen,
      this.onIconTapToCloseDrawer,
      this.onIconTapToOpenDrawer,
      this.themeOnPressed,this.themeIcon});

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: isDrawerOpen
          ? AppBarIcon(
              icon:Icons.arrow_back_ios_outlined,
              onPressed: onIconTapToCloseDrawer,
            )
          : AppBarIcon(
              icon: Icons.menu,
              onPressed: onIconTapToOpenDrawer,
            ),
      actions: [
        AppBarIcon(onPressed: () {}, icon: Icons.notifications_none_rounded),
        AppBarIcon(
          onPressed: themeOnPressed,
          icon: themeIcon
        ),
      ],
    );
  }
}
