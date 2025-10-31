import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wtracker/pages/login_page.dart';

class InformationScreen extends StatefulWidget {
  const InformationScreen({super.key});

  @override
  State<InformationScreen> createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  // Buton tıklanınca yapılacak işlem
  void goNextPage() {
    // Buraya navigator'ı ekleyeceğiz
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff2f2f2), // açık gri arka plan
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// --- ÜST GÖRSEL ---
                Image.asset(
                  'assets/icons/dumbell.png', // kendi görsel yolun
                  width: 180,
                ),
                const SizedBox(height: 32),

                /// --- BAŞLIK ---
                const Text(
                  "Your AI Fitness Companion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                /// --- ALT YAZI ---
                const Text(
                  "AI-powered tracking that analyzes your workouts and guides your progress.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 42),

                /// --- BUTON ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: goNextPage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}