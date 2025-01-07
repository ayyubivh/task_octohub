import 'package:flutter/material.dart';
import 'package:task_octohub/const.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                  child: const Icon(
                    Icons.add,
                    color: whiteColor,
                  ),
                )
              ],
            ),
            Container(
              color: primaryColor.withOpacity(0.02),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/shield.png',
                        color: whiteColor,
                        height: 200,
                      ),
                      Positioned(
                        top: 50,
                        left: 0,
                        right: 0,
                        child: Image.asset(
                          'assets/lock.png',
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's add a password!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "You can protect your accounts \nby adding all your passwords here.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          fixedSize: const Size(300, 55)),
                      onPressed: () {},
                      child: const Text(
                        'Add password',
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
