import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List <Widget> _pages=[
    CategoriesScreen(),
    FavoritesScreen(),
  ];

  final List <String> appBarName = [
    'Categories',
    'Your Favorites'
  ];
 
  int _selectedPageIndex=0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(appBarName[_selectedPageIndex]),
    ),
    body: _pages[_selectedPageIndex],
    bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.amber,
      currentIndex: _selectedPageIndex,
      onTap: _selectPage,
      backgroundColor: Theme.of(context).primaryColor,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.category),
        title: Text('Categories')
        ),
        BottomNavigationBarItem(icon: Icon(Icons.star),
        title: Text('Favorites')
        )
      ]
    ),
    drawer: MainDrawer(),
    );
  }
}