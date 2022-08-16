import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'AppInterface/ui_helpers.dart';


void httpErrorHandle({
  required Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.data)['msg']);
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.data)['error']);
      break;
    default:
      showSnackBar(context, response.data);
  }
}
