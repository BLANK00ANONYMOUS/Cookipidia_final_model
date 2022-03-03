import 'package:cookipidia/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'cookipidia_theme.dart';
import 'screens/home.dart';
import 'package:provider/provider.dart';
import 'models/models.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const Cookipidia());
}

class Cookipidia extends StatefulWidget {
  const Cookipidia({Key? key}) : super(key: key);

  @override
  State<Cookipidia> createState() => _CookipidiaState();
}

class _CookipidiaState extends State<Cookipidia> {
  final _groceryManager = GroceryManager();
  final _profileManager = ProfileManager();
  final _appStateManager = AppStateManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      groceryManager: _groceryManager,
      profileManager: _profileManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _groceryManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _profileManager,
        ),
        ChangeNotifierProvider(
          create: (context) => _appStateManager,
        ),
      ],
      child: Consumer<ProfileManager>(
        builder: (context, profileManager, child) {
          ThemeData theme;
          if (profileManager.darkMode) {
            theme = CookipidiaTheme.dark();
          } else {
            theme = CookipidiaTheme.light();
          }

          return MaterialApp(
            theme: theme,
            title: 'Cookipidia',
            home: Router(
              routerDelegate: _appRouter,
              backButtonDispatcher: RootBackButtonDispatcher(),
            ),
          );
        },
      ),
    );
  }
}

// PAGE - 304
