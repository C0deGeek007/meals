import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
class MainDrawer extends StatelessWidget {

  Widget buildListTitle(String title , IconData icon, Function tapHandler) {
    return  ListTile(
            leading: Icon(icon,size: 26,),
            title: Text(title,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),

            ),
            onTap: () {
              tapHandler();
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text("dbebfb",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.pink
              ),
            ),
            color: Colors.amber,
          ),
          SizedBox(height: 20,),

          buildListTitle('Meals' ,
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),

          buildListTitle('Filter' ,
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routenName);
            }
          ),

        ],
      ),
    );
  }
}