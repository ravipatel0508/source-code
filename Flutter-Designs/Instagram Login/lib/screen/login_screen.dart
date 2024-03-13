import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_ui/constants/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  final String instaLogo = 'assets/image/Instagram-Logo.svg';
  final String instaBlackLogo = 'assets/image/Instagram-Black-Logo.svg';
  final String instaWhiteLogo = 'assets/image/Instagram-White-Logo.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(instaWhiteLogo),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Phone number, username or email address',
                  hintStyle: const TextStyle(color: AppColors.greyShadeColor),
                  fillColor: AppColors.greyColor,
                  filled: true,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                  suffixIcon: const Icon(
                    Icons.visibility_off,
                    color: Colors.white,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: AppColors.greyShadeColor),
                  fillColor: AppColors.greyColor,
                  filled: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: AppColors.blueColor),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  minimumSize: const Size(double.infinity, 40),
                ),
                child: const Text(
                  'Log in',
                  style: TextStyle(color: AppColors.whiteColor),
                ),
              ),
              Row(
                children: const [
                  Expanded(
                    child: Divider(
                      color: AppColors.greyShadeColor,
                      thickness: 1,
                      height: 50,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.greyShadeColor,
                      thickness: 1,
                      height: 50,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.backgroundColor,
                ),
                icon: const Icon(
                  Icons.facebook,
                ),
                label: const Text('Log in with Facebook'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: AppColors.backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              color: AppColors.greyShadeColor,
              thickness: 1,
              height: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(color: AppColors.greyShadeColor),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 14.5, color: AppColors.blueColor),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
