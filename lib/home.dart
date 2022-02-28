import 'package:cookipidia/screens/explore_screen.dart';
import 'package:flutter/material.dart';
import 'components/card1.dart';
import 'components/card2.dart';
import 'screens/recipes_screen.dart';
import 'components/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

// 8
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    Container(color: Colors.blue),
  ];

// 9
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cookipidia',
// 2
          style: Theme.of(context).textTheme.headline6,
        ),
      ),

      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
// 5
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To Buy',
          ),
        ],
      ),
    );
  }
}
