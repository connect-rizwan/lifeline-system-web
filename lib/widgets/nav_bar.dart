import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline_system_website/config/Colors/app_colors.dart';
import 'package:lifeline_system_website/config/responsive/responsive_handler.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHandler.isMobile(context) ? 16 : 32,
        vertical: ResponsiveHandler.isMobile(context) ? 8 : 0,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 0.5,
          ),
        ),
      ),
      child: ResponsiveHandler.isMenuWidthReach(context)
          ? _buildMobileNavBar(context)
          : _buildDesktopNavBar(context),
    );
  }

  Widget _buildDesktopNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(context),
        Row(
          children: [
            _buildNavLink(context, 'Home', '/'),
            _buildNavLink(context, 'Products', '/products'),
            _buildNavLink(context, 'Our App', '/app'),
            _buildNavLink(context, 'Contact', '/contact'),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileNavBar(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildLogo(context, isMobile: true),
            IconButton(
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
              icon: Icon(
                _isMenuOpen ? Icons.close : Icons.menu,
                color: Theme.of(context).colorScheme.onSurface,
                size: 28,
              ),
            ),
          ],
        ),
        if (_isMenuOpen) _buildMobileMenu(context),
      ],
    );
  }

  Widget _buildMobileMenu(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Column(
        children: [
          const SizedBox(height: 16),
          _buildMobileNavLink(context, 'Home', '/'),
          _buildMobileNavLink(context, 'Products', '/products'),
          _buildMobileNavLink(context, 'Our App', '/app'),
          _buildMobileNavLink(context, 'Contact', '/contact'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context, {bool isMobile = false}) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/');
        if (isMobile && _isMenuOpen) {
          setState(() {
            _isMenuOpen = false;
          });
        }
      },
      child: Row(
        children: [
          Image.asset(
            'assets/images/top_logo.png',
            height: ResponsiveHandler.isMobile(context) ? 80 : 100,
          ),
        ],
      ),
    );
  }

  Widget _buildNavLink(BuildContext context, String label, String route) {
    final isActive = GoRouterState.of(context).uri.path == route;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHandler.isTablet(context) ? 8 : 12,
        ),
        child: GestureDetector(
          onTap: () => GoRouter.of(context).go(route),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: ResponsiveHandler.isTablet(context) ? 14 : 16,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive
                  ? AppColors.callToActionColor
                  : Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNavLink(BuildContext context, String label, String route) {
    final isActive = GoRouterState.of(context).uri.path == route;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(route);
          setState(() {
            _isMenuOpen = false;
          });
        },
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive
                ? AppColors.callToActionColor
                : Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }
}
