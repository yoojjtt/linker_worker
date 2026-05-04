import 'package:flutter/material.dart';

import '../services/dummy_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _idController = TextEditingController();
  final _pwController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                const SizedBox(height: 48),
                // Logo
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: AppColors.bgCard,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Image.asset('assets/images/logo_linker.png'),
                  ),
                ),
                const SizedBox(height: 8),
                const Text('LINKER.', style: AppTextStyles.logoTitle),
                const SizedBox(height: 24),
                // Headline
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppTextStyles.heading2,
                    children: [
                      const TextSpan(text: '일과 사람을 잇는\n가장 '),
                      TextSpan(
                        text: '빠른',
                        style: AppTextStyles.heading2.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryBlue,
                          decorationThickness: 2,
                        ),
                      ),
                      const TextSpan(text: ' 방법'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  '정확한 출결과 투명한 정산,\n링커에서 지금 시작하세요.',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: 20),
                // Status badge
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.7),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEEF1F8),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.fingerprint,
                          size: 20,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('STATUS', style: AppTextStyles.badge),
                          Text(
                            '현재 4,291명의 파트너가 근무 중',
                            style: AppTextStyles.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                // ID field
                _buildTextField(
                  label: '아이디',
                  hint: '아이디를 입력하세요',
                  controller: _idController,
                ),
                const SizedBox(height: 16),
                // Password field
                _buildTextField(
                  label: '비밀번호',
                  hint: '비밀번호를 입력하세요',
                  controller: _pwController,
                  obscure: true,
                ),
                const SizedBox(height: 24),
                // Login button
                ElevatedButton(
                  onPressed: _onLogin,
                  child: const Text('로그인'),
                ),
                const SizedBox(height: 12),
                // Register button
                OutlinedButton(
                  onPressed: _onRegister,
                  child: const Text('회원가입'),
                ),
                const SizedBox(height: 16),
                // Find ID / Reset password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '아이디 찾기',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Text('•', style: TextStyle(color: AppColors.textHint)),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '비밀번호 재설정',
                        style: AppTextStyles.labelSmall.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  '© 2024 Linker Co., Ltd. All rights reserved.',
                  style: AppTextStyles.copyright,
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelSmall),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(hintText: hint),
        ),
      ],
    );
  }

  void _onLogin() async {
    final userId = _idController.text.trim();
    final userPwd = _pwController.text.trim();

    if (userId.isEmpty || userPwd.isEmpty) {
      _showSnackBar('아이디와 비밀번호를 입력하세요.');
      return;
    }

    final user = await DummyService.login(userId, userPwd);
    if (!mounted) return;

    if (user != null) {
      _showSnackBar('${user['user_name']}님 환영합니다!');
      // TODO: Navigate to home screen
    } else {
      _showSnackBar('아이디 또는 비밀번호가 올바르지 않습니다.');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  void _onRegister() {
    _showSnackBar('회원가입 화면 준비 중입니다.');
  }
}
