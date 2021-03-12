import 'package:cat_or_dog_ia/pages/about_page.dart';
import 'package:flutter/material.dart';

Widget myDrawer(BuildContext context) {
  return Drawer(
    elevation: 10.0,
    child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 50.0,
              child: Icon(
                Icons.report_gmailerrorred_outlined,
                color: Colors.white,
                size: 60.0,
              ),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'About',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AboutPage()),
            );
          },
          leading: Icon(Icons.announcement),
        ),
      ],
    ),
  );
}
