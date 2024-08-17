import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Find all svg as base64', (){
    Directory dirWithWebSvg = Directory('assets/web-svg/room_type_icons');
    List<String> webSvgFiles =
    dirWithWebSvg.listSync().map((e) => e.path).toList();
  });
}