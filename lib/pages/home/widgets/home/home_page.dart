import 'package:auto_route/auto_route.dart';
import 'package:base/app/cubit/app_cubit.dart';
import 'package:base/global/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../global/constant/constant_enum.dart';
import '../../../../global/l10n/l10n.dart';
import '../../components/drawer_home.dart';
import 'cubit/home_cubit.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final String appVersion;
  final GlobalKey<ScaffoldState> scfKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == FetchStatus.fetchFailure) {
          context.read<AppCubit>().sendError(screen: 'HomePage', error: state.errorMsg);
        }
      },
      child: AutoTabsRouter(
        duration: const Duration(microseconds: 1),
        routes: const [
          TicketRoute(),
          AccountRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            key: scfKey,
            body: child,
            drawer: const DrawerHome(),
            bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) {
                  tabsRouter.setActiveIndex(index);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: AppLocalizations.of(context)!.commonHOME,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_circle_outlined),
                    label: AppLocalizations.of(context)!.commonACCOUNT,
                  ),
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
