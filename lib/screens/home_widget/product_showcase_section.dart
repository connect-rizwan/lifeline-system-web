import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';
import 'package:lifeline_system_website/screens/home_widget/modern_button.dart';
import 'package:lifeline_system_website/screens/home_widget/section_header.dart';

class ProductShowcaseSection extends StatefulWidget {
  const ProductShowcaseSection({super.key});

  @override
  State<ProductShowcaseSection> createState() => _ProductShowcaseSectionState();
}

class _ProductShowcaseSectionState extends State<ProductShowcaseSection> {
  Widget _buildProfessionalProductCard({
    required String title,
    required String subtitle,
    required String price,
    required String originalPrice,
    required List<String> features,
    required IconData icon,
    required Color accentColor,
    required bool isFeatured,
    required String badge,
    required BuildContext context,
  }) {
    // Responsive card width
    double cardWidth;
    if (ResponsiveHandler.isDesktop(context)) {
      cardWidth = 320;
    } else if (ResponsiveHandler.isTablet(context)) {
      cardWidth = 280;
    } else {
      cardWidth = ResponsiveHandler.getWidth(context) - 48;
    }

    // Responsive padding
    double cardPadding = ResponsiveHandler.isMobile(context) ? 20 : 28;

    // Responsive font sizes
    double titleFontSize = ResponsiveHandler.isMobile(context) ? 20 : 22;
    double priceFontSize = ResponsiveHandler.isMobile(context) ? 24 : 28;
    double iconSize = ResponsiveHandler.isMobile(context) ? 24 : 28;
    double iconContainerSize = ResponsiveHandler.isMobile(context) ? 50 : 60;

    return Container(
      width: cardWidth,
      constraints: BoxConstraints(
        minHeight: ResponsiveHandler.isMobile(context) ? 450 : 500,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFeatured ? accentColor : Colors.grey.shade200,
          width: isFeatured ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (isFeatured)
            Positioned(
              top: -1,
              left: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.inter(
                    fontSize: ResponsiveHandler.isMobile(context) ? 10 : 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.all(cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: iconContainerSize,
                      height: iconContainerSize,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            accentColor.withValues(alpha: 0.1),
                            accentColor.withValues(alpha: 0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        color: accentColor,
                        size: iconSize,
                      ),
                    ),
                    const Spacer(),
                    if (!isFeatured)
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          badge,
                          style: GoogleFonts.inter(
                            fontSize:
                                ResponsiveHandler.isMobile(context) ? 9 : 10,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: ResponsiveHandler.isMobile(context) ? 16 : 20),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    fontSize: ResponsiveHandler.isMobile(context) ? 12 : 13,
                    color: const Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: titleFontSize,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF111827),
                  ),
                ),
                SizedBox(height: ResponsiveHandler.isMobile(context) ? 10 : 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.inter(
                        fontSize: priceFontSize,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF111827),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      originalPrice,
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHandler.isMobile(context) ? 14 : 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF9CA3AF),
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHandler.isMobile(context) ? 20 : 24),
                Column(
                  children: features
                      .map((feature) => Padding(
                            padding: EdgeInsets.only(
                              bottom:
                                  ResponsiveHandler.isMobile(context) ? 8 : 10,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 18,
                                  height: 18,
                                  decoration: BoxDecoration(
                                    color: accentColor.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    size: 12,
                                    color: accentColor,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: GoogleFonts.inter(
                                      fontSize:
                                          ResponsiveHandler.isMobile(context)
                                              ? 13
                                              : 14,
                                      color: const Color(0xFF374151),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
                SizedBox(height: ResponsiveHandler.isMobile(context) ? 24 : 28),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isFeatured ? accentColor : const Color(0xFFF9FAFB),
                      foregroundColor:
                          isFeatured ? Colors.white : const Color(0xFF374151),
                      padding: EdgeInsets.symmetric(
                        vertical: ResponsiveHandler.isMobile(context) ? 12 : 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: isFeatured
                            ? BorderSide.none
                            : BorderSide(color: Colors.grey.shade300),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      isFeatured ? 'Get Started' : 'Learn More',
                      style: GoogleFonts.inter(
                        fontSize: ResponsiveHandler.isMobile(context) ? 14 : 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Responsive section padding
    double horizontalPadding = ResponsiveHandler.isMobile(context) ? 16 : 24;
    double verticalPadding = ResponsiveHandler.isMobile(context) ? 60 : 100;

    // Responsive spacing
    double headerSpacing = ResponsiveHandler.isMobile(context) ? 40 : 70;
    double cardSpacing = ResponsiveHandler.isMobile(context) ? 16 : 24;
    double buttonSpacing = ResponsiveHandler.isMobile(context) ? 40 : 60;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFFFCFCFD),
      ),
      child: SizedBox(
        width: ResponsiveHandler.getWidth(context),
        child: Column(
          children: [
            const SectionHeader(
              title: 'Choose Your Protection Plan',
              subtitle:
                  'Professional-grade safety solutions tailored to your lifestyle and needs.',
            ),
            SizedBox(height: headerSpacing),
            if (ResponsiveHandler.isDesktop(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfessionalProductCard(
                    title: 'Essential Guard',
                    subtitle: 'Basic Protection',
                    price: '\$129',
                    originalPrice: '\$149',
                    features: [
                      'Emergency button activation',
                      'GPS location tracking',
                      '24/7 monitoring center',
                      'Water-resistant design',
                    ],
                    icon: Icons.security_rounded,
                    accentColor: const Color(0xFF059669),
                    isFeatured: false,
                    badge: 'VALUE',
                    context: context,
                  ),
                  SizedBox(width: cardSpacing),
                  _buildProfessionalProductCard(
                    title: 'Professional Plus',
                    subtitle: 'Advanced Protection',
                    price: '\$249',
                    originalPrice: '\$299',
                    features: [
                      'AI-powered fall detection',
                      'Health vitals monitoring',
                      'Family app integration',
                      'Two-way communication',
                      'Medication reminders',
                    ],
                    icon: Icons.shield_rounded,
                    accentColor: const Color(0xFF2563EB),
                    isFeatured: true,
                    badge: 'MOST POPULAR',
                    context: context,
                  ),
                  SizedBox(width: cardSpacing),
                  _buildProfessionalProductCard(
                    title: 'Enterprise Shield',
                    subtitle: 'Premium Protection',
                    price: '\$399',
                    originalPrice: '\$449',
                    features: [
                      'Complete health ecosystem',
                      'Advanced AI analytics',
                      'Priority medical response',
                      'Custom alert protocols',
                      'Dedicated support team',
                    ],
                    icon: Icons.diamond_rounded,
                    accentColor: const Color(0xFF7C3AED),
                    isFeatured: false,
                    badge: 'PREMIUM',
                    context: context,
                  ),
                ],
              )
            else if (ResponsiveHandler.isTablet(context))
              Wrap(
                alignment: WrapAlignment.center,
                spacing: cardSpacing,
                runSpacing: cardSpacing,
                children: [
                  _buildProfessionalProductCard(
                    title: 'Essential Guard',
                    subtitle: 'Basic Protection',
                    price: '\$129',
                    originalPrice: '\$149',
                    features: [
                      'Emergency button activation',
                      'GPS location tracking',
                      '24/7 monitoring center',
                      'Water-resistant design',
                    ],
                    icon: Icons.security_rounded,
                    accentColor: const Color(0xFF059669),
                    isFeatured: false,
                    badge: 'VALUE',
                    context: context,
                  ),
                  _buildProfessionalProductCard(
                    title: 'Professional Plus',
                    subtitle: 'Advanced Protection',
                    price: '\$249',
                    originalPrice: '\$299',
                    features: [
                      'AI-powered fall detection',
                      'Health vitals monitoring',
                      'Family app integration',
                      'Two-way communication',
                      'Medication reminders',
                    ],
                    icon: Icons.shield_rounded,
                    accentColor: const Color(0xFF2563EB),
                    isFeatured: true,
                    badge: 'MOST POPULAR',
                    context: context,
                  ),
                  _buildProfessionalProductCard(
                    title: 'Enterprise Shield',
                    subtitle: 'Premium Protection',
                    price: '\$399',
                    originalPrice: '\$449',
                    features: [
                      'Complete health ecosystem',
                      'Advanced AI analytics',
                      'Priority medical response',
                      'Custom alert protocols',
                      'Dedicated support team',
                    ],
                    icon: Icons.diamond_rounded,
                    accentColor: const Color(0xFF7C3AED),
                    isFeatured: false,
                    badge: 'PREMIUM',
                    context: context,
                  ),
                ],
              )
            else
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    _buildProfessionalProductCard(
                      title: 'Essential Guard',
                      subtitle: 'Basic Protection',
                      price: '\$129',
                      originalPrice: '\$149',
                      features: [
                        'Emergency button activation',
                        'GPS location tracking',
                        '24/7 monitoring center',
                        'Water-resistant design',
                      ],
                      icon: Icons.security_rounded,
                      accentColor: const Color(0xFF059669),
                      isFeatured: false,
                      badge: 'VALUE',
                      context: context,
                    ),
                    SizedBox(width: cardSpacing),
                    _buildProfessionalProductCard(
                      title: 'Professional Plus',
                      subtitle: 'Advanced Protection',
                      price: '\$249',
                      originalPrice: '\$299',
                      features: [
                        'AI-powered fall detection',
                        'Health vitals monitoring',
                        'Family app integration',
                        'Two-way communication',
                        'Medication reminders',
                      ],
                      icon: Icons.shield_rounded,
                      accentColor: const Color(0xFF2563EB),
                      isFeatured: true,
                      badge: 'MOST POPULAR',
                      context: context,
                    ),
                    SizedBox(width: cardSpacing),
                    _buildProfessionalProductCard(
                      title: 'Enterprise Shield',
                      subtitle: 'Premium Protection',
                      price: '\$399',
                      originalPrice: '\$449',
                      features: [
                        'Complete health ecosystem',
                        'Advanced AI analytics',
                        'Priority medical response',
                        'Custom alert protocols',
                        'Dedicated support team',
                      ],
                      icon: Icons.diamond_rounded,
                      accentColor: const Color(0xFF7C3AED),
                      isFeatured: false,
                      badge: 'PREMIUM',
                      context: context,
                    ),
                  ],
                ),
              ),
            SizedBox(height: buttonSpacing),
            if (ResponsiveHandler.isMobile(context))
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ModernButton(
                      text: 'Start Free Trial',
                      isPrimary: true,
                      onPressed: () => GoRouter.of(context).go('/trial'),
                      icon: Icons.play_arrow_rounded,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ModernButton(
                      text: 'View All Products',
                      isPrimary: false,
                      onPressed: () => GoRouter.of(context).go('/products'),
                      icon: Icons.arrow_forward_rounded,
                    ),
                  ),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ModernButton(
                    text: 'View All Products',
                    isPrimary: false,
                    onPressed: () => GoRouter.of(context).go('/products'),
                    icon: Icons.arrow_forward_rounded,
                  ),
                  const SizedBox(width: 16),
                  ModernButton(
                    text: 'Start Free Trial',
                    isPrimary: true,
                    onPressed: () => GoRouter.of(context).go('/trial'),
                    icon: Icons.play_arrow_rounded,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
