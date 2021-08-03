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
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // child: Image(
                    //   fit: BoxFit.cover,
                    //   image: AssetImage('assets/bunny.png'),
                    // ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Drawer',
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
                  text: 'Settings',
                  icon: Icons.error_outline,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Profile',
                  icon: Icons.person_outline,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Messages',
                  icon: Icons.chat,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Saved',
                  icon: Icons.bookmark_border,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Favorites',
                  icon: Icons.favorite_border,
                ),
                SizedBox(height: 20),
                DrawerItem(
                  text: 'Hint',
                  icon: Icons.lightbulb_outline,
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
