import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class RegisterStep1Screen extends StatefulWidget {
  const RegisterStep1Screen({super.key});

  @override
  State<RegisterStep1Screen> createState() => _RegisterStep1ScreenState();
}

class _RegisterStep1ScreenState extends State<RegisterStep1Screen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ssnFrontController = TextEditingController();
  final _ssnBackController = TextEditingController();
  final _phoneController = TextEditingController();

  String _selectedCarrier = 'SKT';
  bool _agreeAll = false;
  bool _agreePrivacy = false;
  bool _agreeIdentity = false;
  bool _agreeTelecom = false;

  final _carriers = ['SKT', 'KT', 'LG U+', '알뜰폰'];

  @override
  void dispose() {
    _nameController.dispose();
    _ssnFrontController.dispose();
    _ssnBackController.dispose();
    _phoneController.dispose();
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
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _buildStepIndicator(),
                        const SizedBox(height: 20),
                        _buildInfoBanner(),
                        const SizedBox(height: 28),
                        _buildNameField(),
                        const SizedBox(height: 24),
                        _buildSsnField(),
                        const SizedBox(height: 24),
                        _buildPhoneField(),
                        const SizedBox(height: 28),
                        _buildTermsSection(),
                        const SizedBox(height: 24),
                        _buildNextButton(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Header ──────────────────────────────────
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          Image.asset('assets/images/logo_linker.png', width: 32, height: 32),
          const SizedBox(width: 8),
          const Text(
            'LINKER.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
              letterSpacing: 1,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.close, color: AppColors.navy),
          ),
        ],
      ),
    );
  }

  // ─── Step Indicator ──────────────────────────
  Widget _buildStepIndicator() {
    return Row(
      children: [
        Text(
          'STEP 01 / 03',
          style: AppTextStyles.caption.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        _buildDot(active: true),
        const SizedBox(width: 6),
        _buildDot(active: false),
        const SizedBox(width: 6),
        _buildDot(active: false),
      ],
    );
  }

  Widget _buildDot({required bool active}) {
    return Container(
      width: active ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryBlue : AppColors.divider,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  // ─── Info Banner ─────────────────────────────
  Widget _buildInfoBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1F8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, size: 20, color: AppColors.primaryBlue),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '수집된 주민등록번호는 관련 법령에 따른 신원 확인 및 행정 업무 외에 사용되지 않습니다.',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Name Field ──────────────────────────────
  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('이름(실명)', style: AppTextStyles.labelSmall),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(hintText: '홍길동'),
          validator: (v) {
            if (v == null || v.trim().isEmpty) return '이름을 입력하세요.';
            if (v.trim().length < 2) return '이름은 2자 이상 입력하세요.';
            if (!RegExp(r'^[가-힣a-zA-Z]+$').hasMatch(v.trim())) {
              return '한글 또는 영문만 입력 가능합니다.';
            }
            return null;
          },
        ),
      ],
    );
  }

  // ─── SSN Field ───────────────────────────────
  Widget _buildSsnField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('주민등록번호', style: AppTextStyles.labelSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            // Front 6 digits
            Expanded(
              flex: 5,
              child: TextFormField(
                controller: _ssnFrontController,
                keyboardType: TextInputType.number,
                maxLength: 6,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  hintText: '앞 6자리',
                  counterText: '',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return '입력하세요.';
                  if (v.length != 6) return '6자리를 입력하세요.';
                  return null;
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-', style: TextStyle(fontSize: 18, color: AppColors.textMuted)),
            ),
            // Back first digit
            SizedBox(
              width: 44,
              child: TextFormField(
                controller: _ssnBackController,
                keyboardType: TextInputType.number,
                maxLength: 1,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  counterText: '',
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return '';
                  if (!['1', '2', '3', '4'].contains(v)) return '';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8),
            // Masked dots
            ...List.generate(
              6,
              (_) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Icon(Icons.circle, size: 10, color: AppColors.navy),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Phone Field ─────────────────────────────
  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('휴대폰 번호', style: AppTextStyles.labelSmall),
        const SizedBox(height: 8),
        Row(
          children: [
            // Carrier dropdown
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.bgInput,
                border: Border.all(color: AppColors.border),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedCarrier,
                  items: _carriers
                      .map((c) => DropdownMenuItem(
                            value: c,
                            child: Text(c, style: AppTextStyles.labelSmall),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _selectedCarrier = v!),
                  icon: const Icon(Icons.keyboard_arrow_down,
                      size: 18, color: AppColors.textMuted),
                ),
              ),
            ),
            const SizedBox(width: 10),
            // Phone number
            Expanded(
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  _PhoneFormatter(),
                ],
                maxLength: 13,
                decoration: const InputDecoration(
                  hintText: '010-1234-5678',
                  counterText: '',
                ),
                validator: (v) {
                  if (v == null || v.isEmpty) return '휴대폰 번호를 입력하세요.';
                  final digits = v.replaceAll('-', '');
                  if (digits.length < 10 || digits.length > 11) {
                    return '올바른 번호를 입력하세요.';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ─── Terms Section ───────────────────────────
  Widget _buildTermsSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          // Agree all
          _buildCheckRow(
            label: '약관에 모두 동의합니다',
            value: _agreeAll,
            bold: true,
            onChanged: (v) {
              setState(() {
                _agreeAll = v;
                _agreePrivacy = v;
                _agreeIdentity = v;
                _agreeTelecom = v;
              });
            },
          ),
          const Divider(height: 24),
          _buildCheckRow(
            label: '[필수] 개인정보 수집 및 이용 동의',
            value: _agreePrivacy,
            hasArrow: true,
            onChanged: (v) => _updateTerm(() => _agreePrivacy = v),
          ),
          const SizedBox(height: 8),
          _buildCheckRow(
            label: '[필수] 고유식별정보 처리 동의',
            value: _agreeIdentity,
            hasArrow: true,
            onChanged: (v) => _updateTerm(() => _agreeIdentity = v),
          ),
          const SizedBox(height: 8),
          _buildCheckRow(
            label: '[필수] 통신사 이용약관 동의',
            value: _agreeTelecom,
            hasArrow: true,
            onChanged: (v) => _updateTerm(() => _agreeTelecom = v),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckRow({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
    bool bold = false,
    bool hasArrow = false,
  }) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: value ? AppColors.primaryBlue : Colors.transparent,
              border: Border.all(
                color: value ? AppColors.primaryBlue : AppColors.divider,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: value
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
                color: bold ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ),
          if (hasArrow)
            const Icon(Icons.chevron_right, size: 20, color: AppColors.textHint),
        ],
      ),
    );
  }

  void _updateTerm(VoidCallback update) {
    setState(() {
      update();
      _agreeAll = _agreePrivacy && _agreeIdentity && _agreeTelecom;
    });
  }

  // ─── Next Button ─────────────────────────────
  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: _onNext,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('다음 단계로 이동'),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 18),
        ],
      ),
    );
  }

  void _onNext() {
    // Validate form fields
    final isFormValid = _formKey.currentState?.validate() ?? false;

    // Validate terms
    if (!_agreePrivacy || !_agreeIdentity || !_agreeTelecom) {
      _showSnackBar('필수 약관에 모두 동의해주세요.');
      return;
    }

    if (!isFormValid) return;

    // Collect step1 data
    final step1Data = {
      'user_name': _nameController.text.trim(),
      'user_ssn_front': _ssnFrontController.text.trim(),
      'user_ssn_back_first': _ssnBackController.text.trim(),
      'user_carrier': _selectedCarrier,
      'user_phone': _phoneController.text.trim(),
    };

    _showSnackBar('STEP 02 화면 준비 중입니다.');
    // TODO: Navigate to Step 2 with step1Data
    debugPrint('Step1 Data: $step1Data');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }
}

/// 전화번호 자동 하이픈 포맷터 (010-1234-5678)
class _PhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digits = newValue.text.replaceAll('-', '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length; i++) {
      if (i == 3 || i == 7) buffer.write('-');
      buffer.write(digits[i]);
    }

    final formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
