import 'package:flutter/material.dart';
import 'package:forms_app/config/configs.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
