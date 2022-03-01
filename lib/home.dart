import 'package:cookipidia/screens/explore_screen.dart';
import 'package:flutter/material.dart';
import 'components/card1.dart';
import 'components/card2.dart';
import 'screens/recipes_screen.dart';
import 'components/card3.dart';
import 'screens/grocery_screen.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

// 8
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager,
        child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cookipidia',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
// 2
// TODO: Replace body
        body: pages[tabManager.selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context)
              .textSelectionTheme.selectionColor,
// 3
          currentIndex: tabManager.selectedTab,
          onTap: (index) {
            tabManager.goToTab(index);
          },
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
    },);
  }
}
