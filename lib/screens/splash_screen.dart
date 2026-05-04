import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late AnimationController _fadeController;
  late Animation<double> _progressAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeIn,
    );

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeInOut),
    );

    _fadeController.forward().then((_) {
      _progressController.forward().then((_) {
        if (!mounted) return;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            children: [
              const Spacer(flex: 3),
              Image.asset(
                'assets/images/logo_linker.png',
                width: 120,
                height: 120,
              ),
              const SizedBox(height: 20),
              const Text('LINKER.', style: AppTextStyles.heading1),
              const Spacer(flex: 4),
              Text(
                '전통적인 신뢰 위에 첨단 기술을 더하다',
                style: AppTextStyles.bodyLarge.copyWith(letterSpacing: 1),
              ),
              const SizedBox(height: 8),
              Text(
                'Precision Human Scale Workforce Management',
                style: AppTextStyles.bodySmall.copyWith(letterSpacing: 0.5),
              ),
              const SizedBox(height: 32),
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  final percent = (_progressAnimation.value * 100).toInt();
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: _progressAnimation.value,
                            minHeight: 6,
                            backgroundColor: AppColors.divider,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.primaryBlue,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'SYSTEM INITIALIZING',
                              style: AppTextStyles.caption,
                            ),
                            Text(
                              '$percent%',
                              style: AppTextStyles.caption.copyWith(
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
