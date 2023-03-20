import 'package:amplify_marketplace/features/user/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerFutureProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify Trips Planner',
        ),
      ),
      body: profileValue.when(
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
        data: (profile) => ListView(
          children: [
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.verified_user,
                  size: 50,
                ),
                title: Text(
                  profile!.email,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            const ListTile(
              dense: true,
              tileColor: Colors.grey,
              visualDensity: VisualDensity(vertical: -4),
            ),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //editProfile(context, profile);
                    },
                    child: const Text('Edit'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
