import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool textContaintext(
  String searchIN,
  String searchFOR,
) {
  return searchIN.toLowerCase().contains(searchFOR.toLowerCase());
}

double stringToDouble(String amount) {
  return double.parse(amount);
}

double sumCartPrices(List<CartProductStruct> products) {
  double sum = 0;
  for (var i in products) {
    sum += ((i.price) * i.count);
  }
  return sum;
}
