import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/location_model.dart';

class LocationService {
  static const String _baseUrl = 'https://countriesnow.space/api/v0.1';

  /// Get all countries
  static Future<List<LocationItem>> getCountries() async {
    final uri = Uri.parse('$_baseUrl/countries/iso');

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load countries: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);

    if (json['error'] == true) {
      throw Exception(json['msg']?.toString() ?? 'Failed to load countries');
    }

    final List data = json['data'] ?? [];

    return data
        .map((item) => LocationItem.fromJson(Map<String, dynamic>.from(item)))
        .where((item) => item.name.isNotEmpty)
        .toList();
  }

  /// Get states for selected country
  static Future<List<LocationItem>> getStates(String country) async {
    final uri = Uri.parse(
      '$_baseUrl/countries/states/q',
    ).replace(queryParameters: {'country': country});

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load states: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);

    if (json['error'] == true) {
      throw Exception(json['msg']?.toString() ?? 'Failed to load states');
    }

    final data = json['data'];

    if (data is! Map) {
      return [];
    }

    final List states = data['states'] ?? [];

    return states
        .map((item) => LocationItem.fromJson(Map<String, dynamic>.from(item)))
        .where((item) => item.name.isNotEmpty)
        .toList();
  }

  /// Get cities for selected country + state
  static Future<List<LocationItem>> getCities({
    required String country,
    required String state,
  }) async {
    final uri = Uri.parse(
      '$_baseUrl/countries/state/cities/q',
    ).replace(queryParameters: {'country': country, 'state': state});

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load cities: ${response.statusCode}');
    }

    final json = jsonDecode(response.body);

    if (json['error'] == true) {
      throw Exception(json['msg']?.toString() ?? 'Failed to load cities');
    }

    final List data = json['data'] ?? [];

    return data
        .map((item) => LocationItem(name: item.toString()))
        .where((item) => item.name.isNotEmpty)
        .toList();
  }
}
