import 'package:flutter/foundation.dart';

class User {
  final String? userId;
  final String? fullName;
  final String? headline;
  final String? branch;
  final String? experience;
  final String? github;
  final String? linkedin;
  final int? currentYear;
  final String? course;
  final List<String>? achievements;
  final List<String>? askMeAbout;
  final List<String>? company;
  final List<String>? techStack;

  User({
    @required this.userId,
    @required this.fullName,
    @required this.headline,
    @required this.branch,
    @required this.experience,
    @required this.github,
    @required this.linkedin,
    @required this.currentYear,
    @required this.course,
    @required this.achievements,
    @required this.askMeAbout,
    @required this.company,
    @required this.techStack,
  });
}
