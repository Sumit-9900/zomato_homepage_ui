import 'package:flutter/material.dart';

class RatingUtils {
  /// Returns a color based on rating value.
  static Color getRatingColor(double rating) {
    if (rating > 4.0) {
      return Colors.green.shade900; // deep green
    } else if (rating >= 3.0 && rating <= 4.0) {
      return Colors.green; // normal green
    } else if (rating >= 2.0 && rating < 3.0) {
      return Colors.orange; // orange
    } else {
      return Colors.red; // red
    }
  }
}
