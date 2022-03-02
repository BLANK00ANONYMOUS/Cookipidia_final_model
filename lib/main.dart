import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'cookipidia_theme.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';

void main() {
  runApp(const Cookipidia());
}

class Cookipidia extends StatelessWidget {
  const Cookipidia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final theme = isDarkMode ? CookipidiaTheme.dark() : CookipidiaTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Cookipidia',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      ),
    );
  }
}

// PAGE - 275
