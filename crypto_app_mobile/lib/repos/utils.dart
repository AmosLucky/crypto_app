import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String addCommas(var number) {
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  return number.toString().replaceAllMapped(reg, mathFunc);
}

String addDollarSign(var number) {
  return "\$" + number.toString();
}

String makeCurrency(var number) {
  return addDollarSign(addCommas(number));
}

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(new SnackBar(content: Text(text)));
}

Future copyString(String text) async {
  Clipboard.setData(ClipboardData(text: text));
}
