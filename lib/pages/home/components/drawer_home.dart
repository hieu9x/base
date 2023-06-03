import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../global/app_themes.dart';
import '../../../global/l10n/l10n.dart';
import '../widgets/home/cubit/home_cubit.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        children: [
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppThemes.backgroundColor,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/banner_imap.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Text(
                      '${context.read<AppCubit>().state.environment == 'DEV' ? 'DEV' : ''} Version ${context.read<AppCubit>().state.appVersion} - '
                      '${DateTime.now().year} © Imap',
                      style: AppThemes.lightTextTheme.labelSmall!.copyWith(fontSize: 13),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.trackingHISTORY ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.trackingMONTHSTATISTICS ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.ticketMYEMPLOYEE ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.commonSCANQR ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.commonIMGAGEUPLOAD ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              AppLocalizations.of(context)?.trackingHISTORYDEVICE ?? '',
              style: AppThemes.lightTextTheme.headlineSmall,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
