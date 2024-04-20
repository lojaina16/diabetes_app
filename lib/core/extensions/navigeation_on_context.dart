import 'package:flutter/material.dart';

extension Navigation on BuildContext {
 Future nextPage(String page, {Object? arguments}) =>
      Navigator.of(this).pushNamed(page, arguments: arguments);
  nextPageWitheRemove(String page, {Object? arguments}) => Navigator.of(this)
      .pushNamedAndRemoveUntil(page, (route) => false, arguments: arguments);

 get pop => Navigator.pop(this);
   popParams(bool result) => Navigator.pop(this,result);

  nextPageReplacement(String page, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(page, arguments: arguments);
}