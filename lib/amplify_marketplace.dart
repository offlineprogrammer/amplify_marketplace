import 'package:amplify_marketplace/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';

class AmplifyMarketPlace extends StatelessWidget {
  const AmplifyMarketPlace({
    required this.isAmplifySuccessfullyConfigured,
    Key? key,
  }) : super(key: key);

  final bool isAmplifySuccessfullyConfigured;

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: isAmplifySuccessfullyConfigured
            ? const HomePage(title: 'Flutter Demo Home Page')
            : const Scaffold(
                body: Center(
                  child: Text(
                    'Tried to reconfigure Amplify; '
                    'this can occur when your app restarts on Android.',
                  ),
                ),
              ),
      ),
    );
  }
}
