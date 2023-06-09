import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_marketplace/models/User.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileServiceProvider = Provider<ProfileService>((ref) {
  return ProfileService();
});

class ProfileService {
  ProfileService();

  Future<User?> getProfile() async {
    try {
      final request = ModelQueries.list(User.classType);
      final response = await Amplify.API.query(request: request).response;

      return response.data?.items.first;
    } on ApiException catch (e) {
      debugPrint('Query failed: $e');
    }
  }

  Future<void> updateUser(User updatedUser) async {
    try {
      final request = ModelMutations.update(updatedUser);

      await Amplify.API.mutate(request: request).response;
    } catch (e) {
      debugPrint('Query failed: $e');
    }
  }
}
