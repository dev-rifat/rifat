import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/about_screen.dart';
import '../widgets/contact_sections.dart';
import '../widgets/heder_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/project_serction.dart';
import '../widgets/skils_section.dart';
import '../widgets/work_exprence.dart';

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final ScrollController _scrollController = ScrollController();

  // Unique GlobalKeys for each section
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _workKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // Function to scroll to a section
  void scrollToSection(String section) {
    GlobalKey? key;
    switch (section) {
      case "About":
        key = _aboutKey;
        break;
      case "Skills":
        key = _skillsKey;
      case "Projects":
        key = _projectsKey;
        break;
      case "Contact":
        key = _contactKey;
        break;
      default:
        key = null;
    }

    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF020817),

      /// MOBILE DRAWER
        endDrawer: Drawer(
          backgroundColor: const Color(0xFF020817),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Close button
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    drawerMenuItem("About", () => scrollToSection("About")),
                    drawerMenuItem("Skills", () => scrollToSection("Skills")),
                    drawerMenuItem("Projects", () => scrollToSection("Projects")),
                    drawerMenuItem("Contact", () => scrollToSection("Contact")),
                  ],
                ),
              ),
            ],
          ),
        ),


      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Container(
                key: _headerKey,
                child: HeaderSection(onMenuTap: scrollToSection),
              ),
              Container(key: _heroKey, child: HeroSection(onMenuTap: scrollToSection,)),
              Container(key: _aboutKey, child: AboutMeSection()),
              Container(key: _skillsKey, child: SkillsSection()),
              Container(key: _workKey, child: WorkExperienceSection()),
              Container(key: _projectsKey, child: ProjectsSection()),
              Container(key: _contactKey, child: ContactSection()),
            ],
          ),
        ),
      ),
    );
  }

  // Drawer menu item widget
  Widget drawerMenuItem(String title, VoidCallback onTap) {
    return ListTile(
      title: Text(title, style: GoogleFonts.poppins(color: Colors.white)),
      onTap: () {
        Navigator.of(context).pop(); // Close the drawer
        onTap();
      },
    );
  }
}
