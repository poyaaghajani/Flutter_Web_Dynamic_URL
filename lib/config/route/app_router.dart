import 'package:aloplay_simulation/config/route/route_names.dart';
import 'package:aloplay_simulation/core/cubit/locale_cubit.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_all/get_club_bloc.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_single/get_single_club_bloc.dart';
import 'package:aloplay_simulation/features/club/presentation/screens/club_detail_screen.dart';
import 'package:aloplay_simulation/features/club/presentation/screens/club_screen.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/club_category_manage_bloc.dart';
import 'package:aloplay_simulation/features/club_category/presentation/screens/club_screen.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/public_coach_manage_bloc.dart';
import 'package:aloplay_simulation/features/coach/presentation/screens/coach_detail_screen.dart';
import 'package:aloplay_simulation/features/coach/presentation/screens/coach_screen.dart';
import 'package:aloplay_simulation/features/home/presentation/screens/home_screen.dart';
import 'package:aloplay_simulation/features/main/presentation/screens/main_screen.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      redirect: (context, state) async {
        final String lan = context.read<LocaleCubit>().state.languageCode;

        if (state.fullPath == '/') {
          return '/$lan';
        } else {
          return null;
        }
      },
      builder: (context, state) => const Scaffold(),
      routes: [
        GoRoute(
          path: '/:lan',
          name: RouteNames.clubCategory,
          builder: (context, state) {
            return BlocProvider.value(
              value: locator.get<ClubCategoryManageBloc>(),
              child: ClubCategoryScreen(),
            );
          },
          routes: [
            GoRoute(
              path: '/:seoName',
              builder: (context, state) => const Scaffold(),
              routes: [
                StatefulShellRoute.indexedStack(
                  builder: (context, state, navigationShell) {
                    return MainScreen(shell: navigationShell);
                  },
                  branches: [
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: '/home',
                          name: RouteNames.home,
                          builder: (context, state) {
                            final seoName =
                                state.pathParameters['seoName'] ?? 'tennis';

                            return BlocProvider.value(
                              value: locator.get<GetPublicClubBloc>(),
                              child: HomeScreen(seoName: seoName),
                            );
                          },
                        ),
                      ],
                    ),
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: 'clubs',
                          name: RouteNames.club,
                          builder: (context, state) {
                            final seoName =
                                state.pathParameters['seoName'] ?? 'tennis';
                            return BlocProvider.value(
                              value: locator.get<GetPublicClubBloc>(),
                              child: ClubScreen(seoName: seoName),
                            );
                          },
                          routes: [
                            GoRoute(
                              path: '/:id',
                              name: RouteNames.clubDetail,
                              builder: (context, state) {
                                final seoName =
                                    state.pathParameters['seoName'] ?? 'tennis';

                                return BlocProvider.value(
                                  value: locator.get<GetSinglePublicClubBloc>(),
                                  child: ClubDetailScreen(
                                    seoName: seoName,
                                    id: state.pathParameters['id']!,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    StatefulShellBranch(
                      routes: [
                        GoRoute(
                          path: '/coaches',
                          name: RouteNames.coach,
                          builder: (context, state) {
                            final seoName =
                                state.pathParameters['seoName'] ?? 'tennis';

                            return BlocProvider.value(
                              value: locator.get<PublicCoachManageBloc>(),
                              child: CoachScreen(seoName: seoName),
                            );
                          },
                          routes: [
                            GoRoute(
                              path: '/:id',
                              name: RouteNames.coachDetail,
                              builder: (context, state) {
                                final seoName =
                                    state.pathParameters['seoName'] ?? 'tennis';

                                return BlocProvider.value(
                                  value: locator.get<PublicCoachManageBloc>(),
                                  child: CoachDetailScreen(
                                    seoName: seoName,
                                    id: state.pathParameters['id']!,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
