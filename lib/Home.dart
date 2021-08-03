import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:leave_request/Drawer/AnimatedPage.dart';
import 'package:leave_request/Drawer/DrawerScreen.dart';
import 'package:leave_request/RequestLeave.dart';
import 'package:provider/provider.dart';

import 'LeavesSummary.dart';
import 'components.dart';
import 'themeSettings/themeProvider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = 'Jane Doe';
  String role = 'Role Role Role Role';
  String empCode = 'NFA2';
  String email = 'janedoe@email.com';
  String phone = '+254792209313';
  String department = "Department";

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, child) => Scaffold(
        body: Stack(
          children: [
            DrawerScreen(),
            AnimatedPage(
              themeOnPressed: () {
                notifier.toggleTheme();
              },
              themeIcon: notifier.darkTheme
                  ? Icons.wb_sunny_outlined
                  : Icons.nightlight_round,
              pageName: 'Dashboard',
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100,
                      color: Theme.of(context).primaryColor,
                    ),
                    employeeDetailsCard(context),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 15, left: 5, right: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          dashboardItem(context, Icons.event_note,
                              RequestLeave(), 'Request Leave'),
                          dashboardItem(context, Icons.note_outlined,
                              LeavesSummary(), 'Leave Summary'),
                          dashboardItem(
                              context,
                              Icons.business_center_outlined,
                              RequestLeave(),
                              'My Delegations'),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          dashboardItem(context, Icons.more_horiz_outlined,
                              RequestLeave(), 'More Options'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardItem(BuildContext context, icon, newPage, label) {
    return Column(
      children: [
        ClickableAvatar(
          icon: Icon(
            icon,
            color: Theme.of(context).backgroundColor,
            size: 40,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => newPage),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        )
      ],
    );
  }

  Widget employeeDetailsCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            depth: -3,
            lightSource: LightSource.bottomRight,
            shadowLightColor: Theme.of(context).scaffoldBackgroundColor,
            color: Theme.of(context).cardColor),
        child: Container(
          height: 280,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/olaf.png'),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  )
                ],
              ),
              employeePropertyRow(context, 'Job Title', role),
              employeePropertyRow(context, "Department", department),
              employeePropertyRow(context, 'Employee ID', empCode),
              employeePropertyRow(context, 'Email Address', email),
              employeePropertyRow(context, 'Phone Number', phone),
            ],
          ),
        ),
      ),
    );
  }

  Widget employeePropertyRow(
      BuildContext context, String property, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            property + ':',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
        ],
      ),
    );
  }
}
