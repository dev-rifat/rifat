import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../global/widgets.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  final _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset > 100 && !_isScrolled) {
      setState(() {
        _isScrolled = true;
      });
    } else if (_scrollController.offset <= 100 && _isScrolled) {
      setState(() {
        _isScrolled = false;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF020817),
            const Color(0xFF020817),
            const Color(0xFF052465),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Animated Title Button
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(0, _isScrolled ? -20 : 0, 0),
            child: CustomButton(text: 'Technical Skills', onPressed: () {}),
          ),
          SizedBox(height: 40),
          // Subtitle
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _isScrolled ? 1 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              color: Color(0xFF020817),

              transform: Matrix4.translationValues(0, _isScrolled ? 0 : 40, 0),
              child: Text(
                "Here are the technologies and tools I work with to build high-performance mobile applications.",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Colors.white70,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          // Skills Grid
          SingleChildScrollView(
            controller: _scrollController,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30,
              runSpacing: 30,
              children: const [
                SkillCategory(
                  title: "Mobile Development",
                  skills: [
                    "Flutter & Dart",
                    "Responsive UI Development",
                    "Pixel-perfect UI",
                    "Clean Architecture",
                    "Reusable Components",
                    "App Store Publishing",
                    "Play Store Publishing",
                  ],
                  color: Colors.blueAccent,
                  delay: 0,
                ),
                SkillCategory(
                  title: "State Management",
                  skills: [
                    "GetX",
                    "BLoC Pattern",
                    "MVC Architecture",
                    "MVVM Architecture",
                    "Dependency Injection",
                  ],
                  color: Colors.blueAccent,
                  delay: 100,
                ),
                SkillCategory(
                  title: "APIs & Backend",
                  skills: [
                    "REST APIs",
                    "GraphQL & Subscriptions",
                    "WebSocket",
                    "Real-time Data Handling",
                    "Firebase Auth",
                    "Firestore",
                  ],
                  color: Colors.blueAccent,
                  delay: 200,
                ),
                SkillCategory(
                  title: "Features & Modules",
                  skills: [
                    "Chat Modules",
                    "Payment Gateway Integration",
                    "Push Notification Systems",
                    "Offline Storage (Hive)",
                    "HRM Solutions",
                    "E-commerce Features",
                    "LMS Development",
                  ],
                  color: Colors.blueAccent,
                  delay: 300,
                ),
                SkillCategory(
                  title: "Push Notification",
                  skills: [
                    "Firebase Cloud Messaging (FCM)",
                    "Pushy",
                    "Apple Push Notification (APNs)",
                    "Notification Systems",
                  ],
                  color: Colors.blueAccent,
                  delay: 400,
                ),
                SkillCategory(
                  title: "Tools & DevOps",
                  skills: [
                    "Git & GitHub",
                    "GitLab",
                    "GitHub Actions CI/CD",
                    "Firebase App Distribution",
                    "Jira",
                    "Zen Hub",
                    "Trello",
                    "Slack",
                    "MS Teams",
                  ],
                  color: Colors.blueAccent,
                  delay: 500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatefulWidget {
  final String title;
  final List<String> skills;
  final Color color;
  final int delay;

  const SkillCategory({
    super.key,
    required this.title,
    required this.skills,
    required this.color,
    required this.delay,
  });

  @override
  State<SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<SkillCategory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Start animation after delay
    Future.delayed(Duration(milliseconds: 500 + widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: _slideAnimation.value,
            child: Transform.scale(
              scale: _isHovered ? 1.02 : _scaleAnimation.value,
              child: Opacity(opacity: _opacityAnimation.value, child: child),
            ),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 340,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [const Color(0xFF1E293B), const Color(0xFF334155)],
            ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_isHovered ? 0.4 : 0.2),
                blurRadius: _isHovered ? 25 : 15,
                spreadRadius: _isHovered ? 2 : 1,
                offset: Offset(0, _isHovered ? 8 : 4),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: widget.color.withOpacity(_isHovered ? 0.3 : 0.1),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Title
              Row(
                children: [
                  Container(
                    width: 4,
                    height: 24,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [widget.color, widget.color.withOpacity(0.7)],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.title,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Skills Chips
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: widget.skills
                    .asMap()
                    .entries
                    .map(
                      (entry) => _SkillChip(
                        skill: entry.value,
                        color: widget.color,
                        delay: entry.key * 100,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillChip extends StatefulWidget {
  final String skill;
  final Color color;
  final int delay;

  const _SkillChip({
    required this.skill,
    required this.color,
    required this.delay,
  });

  @override
  State<_SkillChip> createState() => __SkillChipState();
}

class __SkillChipState extends State<_SkillChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(Duration(milliseconds: 800 + widget.delay), () {
      if (mounted) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _isHovered ? 1.1 : _scaleAnimation.value,
            child: Opacity(opacity: _opacityAnimation.value, child: child),
          );
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            gradient: _isHovered
                ? LinearGradient(
                    colors: [widget.color, widget.color.withOpacity(0.8)],
                  )
                : LinearGradient(
                    colors: [
                      widget.color.withOpacity(0.7),
                      widget.color.withOpacity(0.5),
                    ],
                  ),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: widget.color.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: 2,
                  offset: const Offset(0, 3),
                ),
            ],
          ),
          child: Text(
            widget.skill,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
