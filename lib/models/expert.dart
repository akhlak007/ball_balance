import 'package:flutter/foundation.dart';

class Expert {
  final String id;
  final String name;
  final String expertise;
  final String bio;
  final double hourlyRate;
  final String imageUrl;
  final List<String> specializations;
  final double rating;
  final int sessionsCompleted;

  Expert({
    required this.id,
    required this.name,
    required this.expertise,
    required this.bio,
    required this.hourlyRate,
    required this.imageUrl,
    required this.specializations,
    this.rating = 0.0,
    this.sessionsCompleted = 0,
  });
}