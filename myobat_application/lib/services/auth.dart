import 'dart:developer';
import 'package:dio/dio.dart' as api;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myobat_application/services/dio.dart';
import 'package:myobat_application/services/user.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  User? _user;
  String? _token;
  bool get authenticated => _isLoggedIn;
  User? get user => _user;
  final storage = const FlutterSecureStorage();

  Auth() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    _token = await storage.read(key: 'token');
    if (_token != null) {
      await tryToken(token: _token);
    }
  }

  Future<bool> login(String email, String password) async {
    Map creds = {
      'email': email,
      'password': password,
      'device_name': 'mobile',
    };

    try {
      api.Response response = await dio().post('/sanctum/token', data: creds);
      log('Login response status: ${response.statusCode}');

      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData['status'] == 1) {
          String token = responseData['token'];
          log('Token received: $token');
          _isLoggedIn = true;
          await tryToken(token: token);
          return true;
        } else {
          log('Login failed: ${responseData['message']}');
          return false;
        }
      } else {
        log('Unexpected login response status: ${response.statusCode}');
        return false;
      }
    } on api.DioException catch (e) {
      log('Login error: $e');
      return false;
    }
  }

  Future storeToken({String? token}) async {
    log('Storing token: $token');
    await storage.write(key: 'token', value: token);
  }

  Future<bool> tryToken({String? token}) async {
    if (token == null) {
      log('No token provided for tryToken');
      return false;
    }

    try {
      api.Response response = await dio().get('/user',
          options: api.Options(headers: {'Authorization': 'Bearer $token'}));

      log('TryToken response status: ${response.statusCode}');

      if (response.statusCode == 200 && response.data['status'] == 1) {
        _isLoggedIn = true;
        _user = User.fromJson(response.data['data']);
        _token = token;
        log('Token validated and set: $_token');
        await storeToken(token: token);
        notifyListeners();
        return true;
      } else if (response.statusCode == 401) {
        log('Unauthorized (401) in tryToken');
        throw Exception('Unauthorized (401)');
      }
    } on api.DioException catch (e) {
      log('TryToken error: $e');
      return false;
    }

    return false;
  }

  Future logout() async {
    _token = await storage.read(key: 'token');
    log('Current token before logout: $_token');
    try {
      if (_token == null || _token!.isEmpty) {
        log('Token not available during logout');
        throw Exception('Token not available');
      }

      api.Response response = await dio().post(
        '/token/delete',
        options: api.Options(headers: {'Authorization': 'Bearer $_token'}),
      );

      if (response.statusCode == 200) {
        log('Logout successful');
        await cleanUp();
        notifyListeners();
      } else {
        log('Logout request failed with status ${response.statusCode}');
        throw Exception(
            'Logout request failed with status ${response.statusCode}');
      }
    } on api.DioException catch (e) {
      log('Dio error during logout: $e');
      throw Exception('Logout failed');
    } catch (e) {
      log('Unexpected error during logout: $e');
      throw Exception('Logout failed unexpectedly');
    }
  }

  Future cleanUp() async {
    log('Cleaning up user data and token');
    _user = null;
    _isLoggedIn = false;
    await storage.delete(key: 'token');
    _token = null;
    notifyListeners();
  }

  Future fetchUserProfile() async {
    try {
      api.Response response = await dio().get('/user',
          options: api.Options(headers: {'Authorization': 'Bearer $_token'}));

      if (response.statusCode == 200 && response.data['status'] == 1) {
        _user = User.fromJson(response.data['data']);
        notifyListeners();
      } else {
        throw Exception('Failed to fetch user profile');
      }
    } on api.DioException catch (e) {
      log('Fetch user profile error: $e');
      throw Exception('Failed to fetch user profile');
    }
  }
}
