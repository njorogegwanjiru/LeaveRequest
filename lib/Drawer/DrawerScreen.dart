import 'package:flutter/material.dart';

import 'DrawerItem.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/olaf.png'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Jane Doe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Column(
              children: [
                DrawerItem(
                  text: 'Home',
                  icon: Icons.home,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'My Profile',
                  icon: Icons.person,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Settings',
                  icon: Icons.settings,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Request Leave',
                  icon: Icons.calendar_today_outlined,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Leaves Summary',
                  icon: Icons.description,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'My Delegations',
                  icon: Icons.business_center_outlined,
                ),
                SizedBox(height: 20),

              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
