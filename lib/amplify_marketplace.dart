import 'package:amplify_marketplace/features/user/profile/ui/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

class AmplifyMarketPlace extends StatelessWidget {
  const AmplifyMarketPlace({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: const ProfilePage(),
      ),
    );
  }
}
