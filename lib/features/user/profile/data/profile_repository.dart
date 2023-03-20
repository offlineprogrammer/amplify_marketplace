import 'package:amplify_marketplace/features/user/profile/services/profile_service.dart';
import 'package:amplify_marketplace/models/ModelProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  ProfileService profileService = ref.read(profileServiceProvider);
  return ProfileRepository(profileService);
});

class ProfileRepository {
  ProfileRepository(this.profileDatastoreService);
  final ProfileService profileDatastoreService;

  Future<User?> get() async {
    await profileDatastoreService.getProfile();
  }
}
