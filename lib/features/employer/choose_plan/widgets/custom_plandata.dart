import 'dart:ui';

final Map<String, Map<String, dynamic>> plans = {
  'Basic': {
    'range': '0–10 employees',
    'price': 10,
    'features': [
      'Basic employee profiles',
      'Attendance tracking',
      'Leave management(limited)',
      'Basic reports'
    ],
    'buttonColor':  Color(0xFFE8712F),
  },
  'Standard': {
    'range': '0–20 employees',
    'price': 20,
    'features': [
      'Basic employee profiles',
      'Attendance tracking',
      'Leave management (limited)',
      'Basic reports',
    ],
    'buttonColor': Color(0xFF2C9DEC),
  },
  'Premium': {
    'range': '0-30 employees',
    'price': 30,
    'features': [
      'Basic employee profiles',
      'Attendance tracking',
      'Leave management (limited)',
      'Basic reports',
    ],
    'buttonColor': Color(0xFF6632D5),
  },
};