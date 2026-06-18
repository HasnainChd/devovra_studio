import 'package:flutter/material.dart';
import '../../core/widgets/navbar.dart';
import '../../core/widgets/mobile_drawer.dart';
import '../../core/widgets/footer.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/services_section.dart';
import 'sections/technologies_section.dart';
import 'sections/why_choose_us_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NavBar(),
      endDrawer: MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            AboutSection(),
            ServicesSection(),
            TechnologiesSection(),
            WhyChooseUsSection(),
            ContactSection(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
