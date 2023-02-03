import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/app_assets.dart';
import 'package:spotify_clone/constants/app_colors.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF121212),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(kBackgroundImage2),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(bottom: 80, child: Image.asset(kSpotifyWhiteIcon, width: 55)),
                    const Positioned(
                      bottom: -70,
                      child: Text(
                        "Millions of Songs.\nFree on Spotify.",
                        style: TextStyle(
                            color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  minimumSize: const Size(300, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Sign up Free", style: TextStyle(color: kBlackColor)),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlackColor,
                    fixedSize: const Size(300, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          kMobileIcon,
                          width: 20,
                          height: 20,
                          color: kWhitColor,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Continue with Mobile Number",
                            style: TextStyle(color: kWhitColor)),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlackColor,
                    fixedSize: const Size(300, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          kGoogleIcon,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Continue with Google", style: TextStyle(color: kWhitColor)),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kBlackColor,
                    fixedSize: const Size(300, 45),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          kFacebookIcon,
                          width: 20,
                          height: 20,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text("Continue with Facebook", style: TextStyle(color: kWhitColor)),
                      )
                    ],
                  )),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Log in",
                  style: TextStyle(color: kWhitColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
