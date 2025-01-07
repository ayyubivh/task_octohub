import 'package:flutter/material.dart';
import 'package:task_octohub/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  "Authenticator",
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
                          'assets/key.png',
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Let's get started",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Generate 2FA codes to keep \nyour data safe and secure",
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
                        'Skan QR-code',
                        style: TextStyle(
                          color: whiteColor,
                        ),
                      )),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: whiteColor,
                          fixedSize: const Size(300, 55)),
                      onPressed: () {},
                      child: const Text(
                        'Enter manually',
                        style: TextStyle(
                          color: Colors.black,
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
