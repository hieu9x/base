// ignore_for_file: constant_identifier_names

import 'package:auto_route/auto_route.dart';
import 'package:base/global/routes.gr.dart';

part 'routes_path.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Widget,Route')
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, path: RoutesName.splash),
    AutoRoute(page: HomeRoute.page, path: RoutesName.home, children: [
      AutoRoute(
        page: TicketTab.page,
        path: RoutesName.ticket,
        children: [
          AutoRoute(page: TicketRoute.page, path: ''),
          // AutoRoute(page: TicketDetailRoute.page, path: ':id'),
        ],
      ),
      AutoRoute(
        page: AccountRoute.page,
      ),
      RedirectRoute(path: '', redirectTo: RoutesName.tracking),
    ]),
  ];
}

@RoutePage(name: 'TicketTab')
class TicketTabPage extends AutoRouter {
  const TicketTabPage({super.key});
}
