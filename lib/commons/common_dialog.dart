import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../global/app_themes.dart';
import '../global/l10n/l10n.dart';

showCommonDialog(
  BuildContext context, {
  required Function() onTapAccept,
  required String content,
  Function()? onTapCancel,
  String title = 'IMAP Employee',
}) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: AppThemes.lightTextTheme.headlineMedium,
          ),
          content: Text(
            content,
            style: AppThemes.lightTextTheme.titleSmall,
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: onTapCancel ??
                  () {
                    Navigator.pop(context);
                  },
              child: Text(
                AppLocalizations.of(context)!.commonBACK,
                style:
                    AppThemes.lightTextTheme.headlineMedium?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ),
            CupertinoDialogAction(
              onPressed: onTapAccept,
              child: Text(
                AppLocalizations.of(context)!.commonCONFIRM,
                style:
                    AppThemes.lightTextTheme.headlineMedium?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );
      });
}
