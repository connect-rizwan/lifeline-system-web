import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';
import 'package:lifeline_system_website/config/Fonts/app_fonts.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';
import 'package:lifeline_system_website/screens/home_widget/modern_button.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  Widget _buildHeroVisual() {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);

    return FadeIn(
      child: Container(
        height: isMobile
            ? 300
            : isTablet
                ? 400
                : 500,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF3B82F6).withOpacity(0.1),
              const Color(0xFF8B5CF6).withOpacity(0.1),
            ],
          ),
          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isMobile ? 16 : 24),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: isMobile
                      ? 180
                      : isTablet
                          ? 220
                          : 350,
                  height: isMobile
                      ? 250
                      : isTablet
                          ? 300
                          : 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(isMobile ? 16 : 20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: isMobile ? 20 : 30,
                        offset: Offset(0, isMobile ? 10 : 15),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: isMobile
                            ? 60
                            : isTablet
                                ? 70
                                : 80,
                        height: isMobile
                            ? 60
                            : isTablet
                                ? 70
                                : 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3B82F6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: isMobile
                              ? 30
                              : isTablet
                                  ? 35
                                  : 40,
                        ),
                      ),
                      SizedBox(height: isMobile ? 12 : 20),
                      Text(
                        'LifeLine System',
                        style: GoogleFonts.inter(
                          fontSize: isMobile
                              ? 14
                              : isTablet
                                  ? 16
                                  : 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1F2937),
                        ),
                      ),
                      SizedBox(height: isMobile ? 4 : 8),
                      Text(
                        'Connected & Protected',
                        style: GoogleFonts.inter(
                          fontSize: isMobile
                              ? 11
                              : isTablet
                                  ? 12
                                  : 14,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrustItem(String value, String label) {
    final isMobile = ResponsiveHandler.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: isMobile ? 16 : 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Akzidenz Grotesk Pro",
            color: AppColors.callToActionColor,
          ),
        ),
        Text(
          label,
          style: isMobile
              ? AppFonts.mediumGrey14.copyWith(fontSize: 12)
              : AppFonts.mediumGrey14,
        ),
      ],
    );
  }

  Widget _buildTrustIndicators() {
    final isMobile = ResponsiveHandler.isMobile(context);

    if (isMobile) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTrustItem('50K+', 'Active Users'),
              _buildTrustItem('24/7', 'Monitoring'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTrustItem('<2min', 'Response Time'),
            ],
          ),
        ],
      );
    }

    return Row(
      children: [
        _buildTrustItem('50K+', 'Active Users'),
        const SizedBox(width: 32),
        _buildTrustItem('24/7', 'Monitoring'),
        const SizedBox(width: 32),
        _buildTrustItem('<2min', 'Response Time'),
      ],
    );
  }

  Widget _buildContent() {
    final isMobile = ResponsiveHandler.isMobile(context);
    final isTablet = ResponsiveHandler.isTablet(context);

    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: SlideInUp(
        duration: const Duration(milliseconds: 800),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 12 : 16,
                vertical: isMobile ? 6 : 8,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF3B82F6).withOpacity(0.1),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFF3B82F6).withOpacity(0.3),
                ),
              ),
              child: Text(
                '✨ Trusted by 50,000+ Families',
                style: isMobile
                    ? AppFonts.mediumBlack12.copyWith(fontSize: 10)
                    : AppFonts.mediumBlack12,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 20),
            RichText(
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              text: TextSpan(
                style: TextStyle(
                  fontSize: isMobile
                      ? 28
                      : isTablet
                          ? 40
                          : 50,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  height: 1.2,
                ),
                children: const [
                  TextSpan(
                    text: 'Your ',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                  TextSpan(
                    text: 'Safety',
                    style: TextStyle(
                      color: AppColors.eraserColor,
                    ),
                  ),
                  TextSpan(
                    text: ',\nOur ',
                    style: TextStyle(color: AppColors.blackColor),
                  ),
                  TextSpan(
                    text: 'Promise',
                    style: TextStyle(
                      color: AppColors.eraserColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: isMobile ? 12 : 20),
            Text(
              'Experience next-generation medical alert technology with instant emergency response, GPS precision, and 24/7 professional monitoring. Your independence, amplified by innovation.',
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: isMobile
                  ? AppFonts.grey18.copyWith(fontSize: 14)
                  : isTablet
                      ? AppFonts.grey18.copyWith(fontSize: 16)
                      : AppFonts.grey18,
            ),
            SizedBox(height: isMobile ? 24 : 40),
            _buildActionButtons(),
            SizedBox(height: isMobile ? 24 : 40),
            _buildTrustIndicators(),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    final isMobile = ResponsiveHandler.isMobile(context);

    if (isMobile) {
      return Column(
        children: [
          SizedBox(
            child: ModernButton(
              text: 'Explore Products',
              isPrimary: true,
              onPressed: () => GoRouter.of(context).go('/products'),
              icon: Icons.arrow_forward,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            child: ModernButton(
              text: 'Watch Demo',
              isPrimary: false,
              onPressed: () {},
              icon: Icons.play_arrow,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        ModernButton(
          text: 'Explore Products',
          isPrimary: true,
          onPressed: () => GoRouter.of(context).go('/products'),
          icon: Icons.arrow_forward,
        ),
        const SizedBox(width: 20),
        ModernButton(
          text: 'Watch Demo',
          isPrimary: false,
          onPressed: () {},
          icon: Icons.play_arrow,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHandler.isMobile(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: isMobile ? null : screenHeight * 0.9,
      width: ResponsiveHandler.getWidth(context),
      decoration: const BoxDecoration(color: AppColors.backgroundColor),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 16 : 20,
          vertical: isMobile ? 40 : 0,
        ),
        child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildContent(),
        const SizedBox(height: 40),
        _buildHeroVisual(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(
          flex: 8,
          child: _buildContent(),
        ),
        const SizedBox(width: 64),
        Expanded(
          flex: 5,
          child: _buildHeroVisual(),
        ),
      ],
    );
  }
}
