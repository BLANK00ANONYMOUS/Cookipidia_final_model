import 'package:cookipidia/models/cookipidia_pages.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';

// 1
class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
// 2
  @override
  final GlobalKey<NavigatorState> navigatorKey;

// 3
  final AppStateManager appStateManager;

// 4
  final GroceryManager groceryManager;

// 5
  final ProfileManager profileManager;

  AppRouter({
    required this.appStateManager,
    required this.groceryManager,
    required this.profileManager,
  }) : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
// 7
    return Navigator(
// 8
      key: navigatorKey,
      onPopPage: _handlePopPage,
// 9
      pages: [
        if (!appStateManager.isInitialized) SplashScreen.page(),
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        if (appStateManager.isLoggedIn && !appStateManager.isOnboardingComplete)
          OnboardingScreen.page(),
        if (appStateManager.isOnboardingComplete)
          Home.page(appStateManager.getSelectedTab),
        if (groceryManager.isCreatingNewItem)
          GroceryItemScreen.page(
            onCreate: (item) {
// 3
              groceryManager.addItem(item);
            },
            onUpdate: (item, index) {
// 4 No update
            },
          ),
        if (groceryManager.selectedIndex != -1)
// 2
          GroceryItemScreen.page(
              item: groceryManager.selectedGroceryItem,
              index: groceryManager.selectedIndex,
              onUpdate: (item, index) {
// 3
                groceryManager.updateItem(item, index);
              },
              onCreate: (_) {
// 4 No create
              }
          ),
        if (profileManager.didSelectUser)
          ProfileScreen.page(profileManager.getUser),
        if (profileManager.didTapOnRaywenderlich)
          WebViewScreen.page(),
      ],
    );
  }

  // TODO: Add _handlePopRange
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }
    if (route.settings.name == CookipidiaPages.onboardingPath) {
      appStateManager.logout();
    }
    if (route.settings.name == CookipidiaPages.groceryItemDetails) {
      groceryManager.groceryItemTapped(-1);
    }
    if (route.settings.name == CookipidiaPages.profilePath) {
      profileManager.tapOnProfile(false);
    }
    if (route.settings.name == CookipidiaPages.raywenderlich) {
      profileManager.tapOnRaywenderlich(false);
    }
    return true;
  }

//10
  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
