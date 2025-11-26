import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ---------------- HeaderSection ----------------

class HeaderSection extends StatelessWidget {
  final Function(String) onMenuTap;
  const HeaderSection({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 700;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 30,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// TITLE
          Text(
            "Rifat",
            style: GoogleFonts.poppins(
              color: Colors.blueAccent,
              fontSize: isMobile ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),

          /// DESKTOP MENU
          if (!isMobile)
            Row(
              children: [
                menuItem("About", onMenuTap),
                menuItem("Skills", onMenuTap),
                menuItem("Projects", onMenuTap),
                menuItem("Contact", onMenuTap),
              ],
            ),

          /// MOBILE MENU ICON
          if (isMobile)
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 28),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                );
              },
            ),
        ],
      ),
    );
  }
}

/// Desktop menu item
Widget menuItem(String title, Function(String) onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14),
    child: InkWell(
      onTap: () => onTap(title),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white70,
          fontSize: 16,
        ),
      ),
    ),
  );
}
