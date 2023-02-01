import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  Function onselected;

  DrawerScreen(this.onselected);

  int CATEGORY = 1, SETTING = 2;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.green),
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: const Text(
              "NewsApp",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {
              onselected(CATEGORY);
            },
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(

                children: const [
                  Icon(Icons.list,),
                  SizedBox(width: 10,),

                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onselected(SETTING);
            },
            child:  Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(

                children: const [
                  Icon(Icons.settings,),
                  SizedBox(width: 10,),

                  Text(
                    'Settings',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
