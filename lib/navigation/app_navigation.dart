import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_navigation_drawer/accessibility/accessibility.dart';
import 'package:persistent_navigation_drawer/favourites/favourites.dart';
import 'package:persistent_navigation_drawer/favourites/favourites_d1.dart';
import 'package:persistent_navigation_drawer/home/home.dart';
import 'package:persistent_navigation_drawer/home/home_d1.dart';
import 'package:persistent_navigation_drawer/home/home_d2.dart';
import 'package:persistent_navigation_drawer/home/home_d3.dart';
import 'package:persistent_navigation_drawer/search/search.dart';
import 'package:persistent_navigation_drawer/search/search_d1.dart';
import 'package:persistent_navigation_drawer/search/search_d2.dart';
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
                    },
                    routes: [
                      /// Home Depth 1
                      GoRoute(
                          path: 'homeDepth1',
                          name: 'HomeDepth1',
                          builder: (context, state) {
                            return HomePageDepth1(
                              key: state.pageKey,
                            );
                          },
                          routes: [
                            /// Home Depth 2
                            GoRoute(
                                path: 'homeDepth2',
                                name: 'HomeDepth2',
                                builder: (context, state) {
                                  return HomePageDepth2(
                                    key: state.pageKey,
                                  );
                                },
                                routes: [
                                  /// Home Depth 3
                                  GoRoute(
                                    path: 'homeDepth3',
                                    name: 'HomeDepth3',
                                    builder: (context, state) {
                                      return HomePageDepth3(
                                        key: state.pageKey,
                                      );
                                    },
                                  )
                                ])
                          ])
                    ])
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
                    },
                    routes: [
                      /// Search Depth 1
                      GoRoute(
                          path: 'searchDepth1',
                          name: 'SearchDepth1',
                          builder: (context, state) {
                            return SearchPageDepth1(
                              key: state.pageKey,
                            );
                          },
                          routes: [
                            /// Search Depth 2
                            GoRoute(
                              path: 'searchDepth2',
                              name: 'SearchDepth2',
                              builder: (context, state) {
                                return SearchPageDepth2(
                                  key: state.pageKey,
                                );
                              },
                            )
                          ])
                    ])
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
                    },
                    routes: [
                      /// Favourites Depth 1
                      GoRoute(
                        path: 'favouritesDepth1',
                        name: 'FavouritesDepth1',
                        builder: (context, state) {
                          return FavouritesPageDepth1(
                            key: state.pageKey,
                          );
                        },
                      )
                    ])
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
