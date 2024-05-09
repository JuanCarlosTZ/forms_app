import 'package:flutter/material.dart';
import 'package:forms_app/config/configs.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...homeMenuItems.map((menuItem) {
            return ListTile(
              title: Text(menuItem.title),
              subtitle: Text(menuItem.subTitle),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () => context.push(menuItem.path),
            );
          }),
        ],
      ),
    );
  }
}
