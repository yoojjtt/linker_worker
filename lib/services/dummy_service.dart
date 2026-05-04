import 'dart:convert';

import 'package:flutter/services.dart';

/// assets/dummy/ 폴더의 JSON 더미 데이터를 로드하는 서비스
class DummyService {
  static final Map<String, dynamic> _cache = {};

  /// JSON 파일을 로드하여 List<Map> 형태로 반환
  static Future<List<Map<String, dynamic>>> loadList(String fileName) async {
    final data = await _loadRaw(fileName);
    return List<Map<String, dynamic>>.from(
      (jsonDecode(data) as List).map((e) => Map<String, dynamic>.from(e)),
    );
  }

  /// JSON 파일을 로드하여 단일 Map 형태로 반환
  static Future<Map<String, dynamic>> loadMap(String fileName) async {
    final data = await _loadRaw(fileName);
    return Map<String, dynamic>.from(jsonDecode(data));
  }

  /// 더미 유저 목록에서 로그인 검증
  static Future<Map<String, dynamic>?> login(
    String userId,
    String userPwd,
  ) async {
    final users = await loadList('users.json');
    try {
      return users.firstWhere(
        (u) => u['user_id'] == userId && u['user_pwd'] == userPwd,
      );
    } catch (_) {
      return null;
    }
  }

  static Future<String> _loadRaw(String fileName) async {
    if (_cache.containsKey(fileName)) {
      return _cache[fileName] as String;
    }
    final data = await rootBundle.loadString('assets/dummy/$fileName');
    _cache[fileName] = data;
    return data;
  }
}
