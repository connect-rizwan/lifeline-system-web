import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveHandler.isMobile(context);
    final bool isTablet = ResponsiveHandler.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: isMobile ? 40 : 64,
      ),
      color: AppColors.blackColor.withValues(alpha: 0.9),
      child: Column(
        children: [
          if (isMobile) ...[
            _buildMobileFooter(context),
          ] else if (isTablet) ...[
            _buildTabletFooter(context),
          ] else ...[
            _buildDesktopFooter(context),
          ],
          const SizedBox(height: 48),
          const Divider(color: Colors.white24),
          const SizedBox(height: 24),
          isMobile
              ? Column(
                  children: [
                    Text(
                      '© 2024 Lifeline Tags. All rights reserved.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildFooterLink(context, 'Privacy Policy', '/privacy'),
                        const SizedBox(width: 24),
                        _buildFooterLink(context, 'Terms of Service', '/terms'),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '© 2024 Lifeline Tags. All rights reserved.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                    Row(
                      children: [
                        _buildFooterLink(context, 'Privacy Policy', '/privacy'),
                        const SizedBox(width: 24),
                        _buildFooterLink(context, 'Terms of Service', '/terms'),
                      ],
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Company Info
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.medical_services,
                        size: 40,
                        color: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Lifeline Tags',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Your safety is our priority.\n24/7 monitoring and support.',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Colors.white.withValues(alpha: 0.8),
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildSocialIcon(Icons.facebook),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.share),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.camera_alt),
                  const SizedBox(width: 16),
                  _buildSocialIcon(Icons.link),
                ],
              ),
            ],
          ),
        ),
        // Quick Links
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Links',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildFooterLink(context, 'Home', '/'),
              _buildFooterLink(context, 'Products', '/products'),
              _buildFooterLink(context, 'Our App', '/app'),
              _buildFooterLink(context, 'Contact', '/contact'),
            ],
          ),
        ),
        // Contact Info
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Us',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildContactInfo(
                Icons.location_on,
                '123 Safety Street\nMedical District, MD 12345',
              ),
              _buildContactInfo(
                Icons.phone,
                '+1 (555) 123-4567',
              ),
              _buildContactInfo(
                Icons.email,
                'support@lifelinetags.se',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Company Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 40,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.medical_services,
                            size: 40,
                            color: Colors.white,
                          );
                        },
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Lifeline Tags',
                        style: GoogleFonts.inter(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your safety is our priority.\n24/7 monitoring and support.',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.8),
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _buildSocialIcon(Icons.facebook),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.share),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.camera_alt),
                      const SizedBox(width: 16),
                      _buildSocialIcon(Icons.link),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 32),
            // Quick Links
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick Links',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildFooterLink(context, 'Home', '/'),
                  _buildFooterLink(context, 'Products', '/products'),
                  _buildFooterLink(context, 'Our App', '/app'),
                  _buildFooterLink(context, 'Contact', '/contact'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Contact Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildContactInfo(
              Icons.location_on,
              '123 Safety Street\nMedical District, MD 12345',
            ),
            _buildContactInfo(
              Icons.phone,
              '+1 (555) 123-4567',
            ),
            _buildContactInfo(
              Icons.email,
              'support@lifelinetags.se',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Logo and Company Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.medical_services,
                      size: 40,
                      color: Colors.white,
                    );
                  },
                ),
                const SizedBox(width: 12),
                Text(
                  'Lifeline Tags',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Your safety is our priority. 24/7 monitoring and support.',
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.8),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSocialIcon(Icons.facebook),
                const SizedBox(width: 16),
                _buildSocialIcon(Icons.share),
                const SizedBox(width: 16),
                _buildSocialIcon(Icons.camera_alt),
                const SizedBox(width: 16),
                _buildSocialIcon(Icons.link),
              ],
            ),
          ],
        ),
        const SizedBox(height: 32),
        // Quick Links
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Quick Links',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildFooterLink(context, 'Home', '/'),
            _buildFooterLink(context, 'Products', '/products'),
            _buildFooterLink(context, 'Our App', '/app'),
            _buildFooterLink(context, 'Contact', '/contact'),
          ],
        ),
        const SizedBox(height: 32),
        // Contact Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildContactInfo(
              Icons.location_on,
              '123 Safety Street\nMedical District, MD 12345',
            ),
            _buildContactInfo(
              Icons.phone,
              '+1 (555) 123-4567',
            ),
            _buildContactInfo(
              Icons.email,
              'support@lifelinetags.se',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text, String path) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).go(path),
        child: Text(
          text,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 20,
            color: Colors.white.withValues(alpha: 0.8),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
