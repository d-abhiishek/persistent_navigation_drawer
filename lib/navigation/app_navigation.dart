import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_navigation_drawer/accessibility/accessibility.dart';
import 'package:persistent_navigation_drawer/favourites/favourites.dart';
import 'package:persistent_navigation_drawer/home/home.dart';
import 'package:persistent_navigation_drawer/search/search.dart';
import 'package:persistent_navigation_drawer/wrapper/main_wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static String initR = '/home';

  /// Private Navigators Key
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _rootNavigatorHome =
      GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _rootNavigatorSearch =
  GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
  static final _rootNavigatorFavourites =
  GlobalKey<NavigatorState>(debugLabel: 'shellFavourites');
  static final _rootNavigatorAccessibility =
  GlobalKey<NavigatorState>(debugLabel: 'shellAccessibility');

  /// Go Router Configuration
  static final GoRouter router = GoRouter(
      initialLocation: initR,
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        /// MainWrapper Route
        StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) {
              return MainWrapper(
                title: 'Persistent Navigation Drawer',
                navigationShell: navigationShell,
              );
            },
            branches: <StatefulShellBranch>[
              /// Branch Home
              StatefulShellBranch(
                navigatorKey: _rootNavigatorHome,
                routes: [
                  GoRoute(
                      path: '/home',
                      name: 'Home',
                      builder: (context, state) {
                        return HomePage(
                          key: state.pageKey,
                        );
                      })
                ],
              ),
              /// Branch Search
              StatefulShellBranch(
                navigatorKey: _rootNavigatorSearch,
                routes: [
                  GoRoute(
                      path: '/search',
                      name: 'Search',
                      builder: (context, state) {
                        return SearchPage(
                          key: state.pageKey,
                        );
                      })
                ],
              ),
              /// Branch Favourites
              StatefulShellBranch(
                navigatorKey: _rootNavigatorFavourites,
                routes: [
                  GoRoute(
                      path: '/favourites',
                      name: 'Favourites',
                      builder: (context, state) {
                        return FavouritesPage(
                          key: state.pageKey,
                        );
                      })
                ],
              ),
              /// Branch Accessibility
              StatefulShellBranch(
                navigatorKey: _rootNavigatorAccessibility,
                routes: [
                  GoRoute(
                      path: '/accessibility',
                      name: 'Accessibility',
                      builder: (context, state) {
                        return AccessibilityPage(
                          key: state.pageKey,
                        );
                      })
                ],
              )
            ],
            // navigatorContainerBuilder: navigatorContainerBuilder
        )
      ]);
}
