import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

class OpenAnotherApp extends StatelessWidget {
  const OpenAnotherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        heightFactor: 1.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FlutterLogo(size: 100),
            const SizedBox(height: 20),
            FittedBox(child: Text("Open Other App", style: Theme.of(context).textTheme.headline2)),
            RichText(
              text: TextSpan(
                children: const [
                  TextSpan(text: "in"),
                  TextSpan(text: " Flutter", style: TextStyle(color: Colors.blue)),
                ],
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton.icon(
              icon: const Icon(Icons.open_in_new),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                LaunchApp.openApp(
                  androidPackageName: 'com.jio.media.jiobeats',
                );
                // Enter the package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
                // The `openStore` argument decides whether the app redirects to PlayStore or AppStore.
                // For testing purpose you can enter com.instagram.android
              },
              label: const Text(
                "Open JioBeats",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
