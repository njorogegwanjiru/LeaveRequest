import 'package:flutter/material.dart';
import 'package:leave_request/components.dart';

class AnimatedPage extends StatefulWidget {
  final List<Widget> children;
  final String pageName;
  final Function themeOnPressed;
  final themeIcon;

  const AnimatedPage({Key key, this.children, this.pageName,this.themeOnPressed,this.themeIcon}) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (drag) {
        if (drag.delta.dx < 0) {
          setState(() {
            xOffset = 0;
            yOffset = 0;
            isDrawerOpen = false;
          });
        } else if (drag.delta.dx > 50) {
          setState(() {
            xOffset = 320;
            yOffset = 80;
            isDrawerOpen = true;
          });
        }
      },
      child: AnimatedContainer(height: MediaQuery.of(context).size.height,
        transform: Matrix4.translationValues(xOffset, yOffset, 0)
          ..scale(isDrawerOpen ? 0.85 : 1.00)
          ..rotateZ(isDrawerOpen ? -50 : 0),
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              // SizedBox(height: 50),
              MainPageAppBar(
                themeOnPressed: widget.themeOnPressed,
                isDrawerOpen: isDrawerOpen,
                title: widget.pageName,
                themeIcon: widget.themeIcon,
                onIconTapToOpenDrawer: () {
                  setState(() {
                    xOffset = 320;
                    yOffset = 80;
                    isDrawerOpen = true;
                  });
                },
                onIconTapToCloseDrawer: () {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    isDrawerOpen = false;
                  });
                },
              ),
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: widget.children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
