import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../common/logger.dart';
import '../domain/meditation_repository.dart';
import '../domain/model/meditation_model.dart';

class MeditationRepositoryImpl implements MeditationRepository {
  List<MeditationModel>? _meditations;

  @override
  Future<List<MeditationModel>?> getMeditations() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final jsonString = await rootBundle.loadString('assets/json/source.json');
      final jsonList = jsonDecode(jsonString) as List;
      final meditations = jsonList
          .map((e) => MeditationModel.fromJson(e as Map<String, dynamic>))
          .toList();
      _meditations = meditations;
      return meditations;
    } catch (e) {
      logger.e('Failed to load meditatons, e: $e');
      return null;
    }
  }

  @override
  List<MeditationModel>? get meditations => _meditations;
}
