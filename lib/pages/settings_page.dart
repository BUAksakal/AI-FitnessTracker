import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE8E8E8),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 0),
        child: Column(
          children: [
            // LANGUAGE
            _settingsTile(
              icon: Icons.language,
              title: "Language",
              onTap: () => _showLanguageSheet(context),
            ),

            const SizedBox(height: 14),

            // SIGN OUT
            _settingsTile(
              icon: Icons.logout,
              title: "Sign Out",
              onTap: () {
                // TODO: SIGN OUT FUNCTION
              },
            ),

            const Spacer(),

            // ABOUT SECTION (PREMIUM & MINIMAL)
            Column(
              children: const [
                Text(
                  "Dumbelly.AI v1.0.0",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Made for Progress. 💪",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // ✅ LANGUAGE BOTTOM SHEET (UI ONLY — FONKSİYONLAR BOŞ)
  void _showLanguageSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title: const Text("English"),
              onTap: () {
                Navigator.pop(context);
                // TODO: apply language "en"
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title: const Text("Türkçe"),
              onTap: () {
                Navigator.pop(context);
                // TODO: apply language "tr"
              },
            ),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.black),
              title: const Text("Deutsch"),
              onTap: () {
                Navigator.pop(context);
                // TODO: apply language "de"
              },
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 18),
          ],
        ),
      ),
    );
  }
}