import 'package:amplify_marketplace/features/user/profile/controller/profile_controller.dart';
import 'package:amplify_marketplace/features/user/profile/ui/edit_favorites_bottomsheet.dart';
import 'package:amplify_marketplace/features/user/profile/ui/favorite_department_chip.dart';

import 'package:amplify_marketplace/models/ModelProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
  });

  void editProfile(BuildContext context, WidgetRef ref, User profile) async {
    var favoritedepartments =
        await showModalBottomSheet<List<MarketPlaceDepartments>>(
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (BuildContext context) {
        return EditFavoritesBottomSheet(
          favoritedepartments: profile.favoritedepartments,
        );
      },
    );

    final updatedProfile = profile.copyWith(
      favoritedepartments: favoritedepartments,
    );

    await ref.read(profileControllerProvider).updateUser(updatedProfile);
    ref.refresh(profileControllerFutureProvider);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileValue = ref.watch(profileControllerFutureProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Amplify e-commerce',
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
                      editProfile(context, ref, profile);
                    },
                    child: const Text('Favorites'),
                  ),
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: <Widget>[
                for (var department in profile.favoritedepartments ?? [])
                  FavoriteDepartmentChip(
                    marketPlaceDepartment: department,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
