import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../global/widgets.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isMobile = width < 768;
    final bool isTablet = width >= 768 && width < 1200;

    return Container(
      color: const Color(0xFF0D1117),
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 60 : 80,
        horizontal: isMobile ? 24 : isTablet ? 60 : 120,
      ),
      child: AnimationLimiter(
        child: Column(
          children: AnimationConfiguration.toStaggeredList(
            duration: const Duration(milliseconds: 800),
            childAnimationBuilder: (w) => SlideAnimation(
              verticalOffset: 50,
              child: FadeInAnimation(child: w),
            ),
            children: [
              _buildHeader(width),
              const SizedBox(height: 40),

              isMobile
                  ? Column(
                children: [
                  _buildContactInfo(isMobile),
                  const SizedBox(height: 30),
                  _buildContactForm(isMobile),
                ],
              )
                  : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _buildContactInfo(isMobile)),
                  const SizedBox(width: 40),
                  Expanded(child: _buildContactForm(isMobile)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(double width) {
    double titleSize = width < 500
        ? 26
        : width < 900
        ? 34
        : 45;

    return Column(
      children: [
        CustomButton(text: 'Get Touch', onPressed: () {}),
        const SizedBox(height: 16),
        Text(
          "Let's Work Together",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return _AnimatedCard(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 18 : 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact Information",
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _contactRow(Icons.email, "engr.kamruz@gmail.com"),
            _contactRow(Icons.link, "linkedin.com/in/kamruz-zaman"),
            _contactRow(Icons.code, "github.com/kamruz-zzaman"),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(bool isMobile) {
    return _AnimatedCard(
      child: Padding(
        padding: EdgeInsets.all(isMobile ? 18 : 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Send a Message",
              style: TextStyle(
                fontSize: isMobile ? 20 : 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            _glowField("Name", Icons.person),
            _glowField("Email", Icons.email),
            _glowMessageField(),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  padding: const EdgeInsets.all(16),
                  elevation: 6,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: const Text(
                  "Send Message",
                  style: TextStyle(fontSize: 14,color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _glowField(String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.blue),
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.white12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _glowMessageField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        maxLines: 4,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: "Your message...",
          filled: true,
          fillColor: const Color(0xFF1E293B),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(4), borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 2),
          ),
        ),
      ),
    );
  }

  Widget _contactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF3B82F6), Color(0xFF1E40AF)]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white70, fontSize: 15),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedCard extends StatelessWidget {
  final Widget child;
  const _AnimatedCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: const Color(0xFF0E1621),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 20, offset: const Offset(0, 10)),
          ],
        ),
        child: child,
      ),
    );
  }
}
