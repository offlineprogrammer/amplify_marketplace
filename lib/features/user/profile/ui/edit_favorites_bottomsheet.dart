import 'package:amplify_marketplace/features/user/profile/controller/profile_controller.dart';
import 'package:amplify_marketplace/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditFavoritesBottomSheet extends ConsumerWidget {
  EditFavoritesBottomSheet({
    required this.profile,
    super.key,
  });

  final User profile;

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<MarketPlaceDepartments>? favoritedepartments =
        profile.favoritedepartments;
    print(favoritedepartments.toString());
    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var department in MarketPlaceDepartments.values)
              CheckboxListTile(
                title: Text(department.name),

                value: favoritedepartments!.contains(department),
                onChanged: (bool? value) {
                  print(value);

                  if (value!) {
                    favoritedepartments.add(department);
                    print(favoritedepartments.toString());
                  } else {
                    favoritedepartments.remove(department);
                  }
                },
                //value: _checked,
              ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    final updatedProfile = profile.copyWith(
                      favoritedepartments: favoritedepartments,
                    );
                    print('updatedProfile.toString()');
                    print(updatedProfile.toString());

                    ref
                        .read(profileControllerProvider)
                        .updateUser(updatedProfile);

                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
