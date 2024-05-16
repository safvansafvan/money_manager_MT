import 'package:flutter/material.dart';
import 'package:moneymanager/presentation/views/settings/widget/settings_tile_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          SettingsTileWidget(
              icon: Icons.feedback_outlined,
              text: 'Feedback',
              isFeedback: true),
          SettingsTileWidget(
              icon: Icons.share_outlined, text: 'Share', isShare: true),
          SettingsTileWidget(
              icon: Icons.restore, text: 'Reset App', resetApp: true),
        ],
      ),
    );
  }
}
