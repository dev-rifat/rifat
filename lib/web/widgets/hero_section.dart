import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<double>(
      begin: 30.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    bool isMobile = width < 600;
    bool isTablet = width >= 600 && width < 1100;
    bool isDesktop = width >= 1100;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile
                ? 20
                : isTablet
                ? 50
                : 80,
            vertical: isMobile
                ? 40
                : isTablet
                ? 60
                : 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset: Offset(0, _slideAnimation.value),
                      child: Opacity(
                        opacity: _fadeAnimation.value,
                        child: _leftText(isMobile, isTablet, isDesktop),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Opacity(
                      opacity: _fadeAnimation.value,
                      child: _rightImage(isMobile, isTablet, isDesktop),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: isTablet
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isTablet ? 5 : 6,
                      child: Transform.translate(
                        offset: Offset(-_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _leftText(isMobile, isTablet, isDesktop),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: isTablet ? 4 : 5,
                      child: Transform.translate(
                        offset: Offset(_slideAnimation.value, 0),
                        child: Opacity(
                          opacity: _fadeAnimation.value,
                          child: _rightImage(isMobile, isTablet, isDesktop),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  Widget _leftText(bool isMobile, bool isTablet, bool isDesktop) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          "Hi,",
          style: GoogleFonts.poppins(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: isMobile
                ? 24
                : isTablet
                ? 32
                : 38,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "I'm Rifat",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: isMobile
                ? 36
                : isTablet
                ? 48
                : 62,
            fontWeight: FontWeight.bold,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Apps Developer",
          style: GoogleFonts.poppins(
            color: Colors.blueAccent,
            fontSize: isMobile
                ? 38
                : isTablet
                ? 52
                : 66,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),

        Text(
          "I develop modern, scalable Flutter applications for mobile and web, following clean architecture principles, with robust state management and seamless user experiences",
          style: GoogleFonts.poppins(color: Colors.grey, fontSize: 16),
        ),
        const SizedBox(height: 40),

        Wrap(
          spacing: 24,
          runSpacing: 16,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            _buildButton(
              "View My Work",
              Colors.blueAccent,
              isMobile,
              click: () async {
                final url = Uri.parse(
                  "https://drive.google.com/file/d/17c5KrbqtvnFzaWQ9QTpxq8X0nGL54kib/view?usp=sharing",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),

            //https://drive.google.com/file/d/17c5KrbqtvnFzaWQ9QTpxq8X0nGL54kib/view?usp=sharing
            _buildButton(
              "My resume",
              Colors.transparent,
              isMobile,
              border: true,
              click: () async {

                print("asdfjjkasdhjfghjsahdjgd");
                final url = Uri.parse(
                  "https://drive.google.com/file/d/17c5KrbqtvnFzaWQ9QTpxq8X0nGL54kib/view?usp=sharing",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(
    String text,
    Color bgColor,
    bool isMobile, {
    bool border = false,
    required Function click,
  }) {
    return GestureDetector(
      onTap: () => click(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 18,
            vertical: isMobile ? 13 : 13,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(3),
            border: border
                ? Border.all(color: Colors.blueAccent, width: .6)
                : null,
            boxShadow: [
              // Shadow for filled button (Got a project?)
              // if (!border) ...[
              //   BoxShadow(
              //     color: Colors.blueAccent.withValues(alpha: 0.6),
              //     blurRadius: 20,
              //     spreadRadius: 2,
              //     offset: const Offset(0, 8),
              //   ),
              //   BoxShadow(
              //     color: Colors.black.withValues(alpha: 0.3),
              //     blurRadius: 15,
              //     offset: const Offset(0, 5),
              //   ),
              // ],
              // Shadow for outline button (My resume)
              // if (border) ...[
              //   BoxShadow(
              //     color: Colors.blueAccent.withValues(alpha: 0.4),
              //     blurRadius: 15,
              //     spreadRadius: 1,
              //     offset: const Offset(0, 5),
              //   ),
              //   BoxShadow(
              //     color: Colors.black.withValues(alpha: 0.2),
              //     blurRadius: 10,
              //     offset: const Offset(0, 3),
              //   ),
              // ],
            ],
          ),
          child: !border
              ? Wrap(
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                        color: border
                            ? Colors.blueAccent
                            : const Color(0xFF020817),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.8,
                      ),
                    ),
                    SizedBox(width: 8),

                    Icon(Icons.arrow_forward_outlined, size: 18),
                  ],
                )
              : Text(
                  text,
                  style: GoogleFonts.poppins(
                    color: border ? Colors.blueAccent : const Color(0xFF020817),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _rightImage(bool isMobile, bool isTablet, bool isDesktop) {
    double containerSize = isMobile
        ? 280
        : isTablet
        ? 360
        : 440;
    double imageSize = isMobile
        ? 220
        : isTablet
        ? 290
        : 350;

    return Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [Color(0xFF1E2A3A), Color(0xFF0E1621)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withValues(alpha: 0.2),
            blurRadius: 40,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Center(
        child: ClipOval(
          child: Image.network(
            "https://cdn.dribbble.com/userupload/11302619/file/original-2ecd4d83189d8c3ac7c8a481cb15c8b9.jpg?resize=800x800",
            width: imageSize,
            height: imageSize,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Container(
                width: imageSize,
                height: imageSize,
                color: Colors.white10,
                child: const CircularProgressIndicator(
                  color: Colors.blueAccent,
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: imageSize,
                height: imageSize,
                color: Colors.white10,
                child: Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                  size: imageSize * 0.3,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
