import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _soundEnabled = true;
  String _difficulty = '普通';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('設置')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '設置選項',
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('開啟音效'),
              value: _soundEnabled,
              onChanged: (value) {
                setState(() {
                  _soundEnabled = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text('選擇遊戲難度'),
            DropdownButton<String>(
              value: _difficulty,
              items: ['簡單', '普通', '困難'].map((difficulty) {
                return DropdownMenuItem(
                  value: difficulty,
                  child: Text(difficulty),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _difficulty = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension on TextTheme {
  get headline5 => null;
}
