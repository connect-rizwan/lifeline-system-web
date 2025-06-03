import 'package:flutter/material.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';
import 'package:lifeline_system_website/screens/home_widget/feature_section.dart';
import 'package:lifeline_system_website/screens/home_widget/hero_section.dart';
import 'package:lifeline_system_website/screens/home_widget/product_showcase_section.dart';
import 'package:lifeline_system_website/screens/home_widget/technology_section.dart';
import 'package:lifeline_system_website/screens/home_widget/testimonial_section.dart';
import 'package:lifeline_system_website/screens/home_widget/trust_partners_section.dart';
import 'package:web_smooth_scroll/web_smooth_scroll.dart';

import '../widgets/footer.dart';
import '../widgets/nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: WebSmoothScroll(
        controller: _scrollController,
        curve: Curves.easeInOut,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: const Column(
            children: [
              NavBar(),
              HeroSection(),
              TrustPartnersSection(),
              FeatureSection(),
              ProductShowcaseSection(),
              TechnologySection(),
              TestimonialSection(),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
