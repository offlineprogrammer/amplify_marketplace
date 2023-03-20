import 'package:amplify_marketplace/features/user/profile/data/profile_repository.dart';
import 'package:amplify_marketplace/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileControllerProvider = Provider<ProfileController>((ref) {
  return ProfileController(ref);
});

final profileControllerFutureProvider =
    FutureProvider.autoDispose<User?>((ref) {
  return ProfileController(ref).getUserProfile();
});

class ProfileController {
  ProfileController(this.ref);
  final Ref ref;

  Future<User?> getUserProfile() async {
    return await ref.read(profileRepositoryProvider).get();
  }
}
