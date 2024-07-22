import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';

void main(){
  test('convert to base64', (){
    String template = 'data:image/svg+xml;base64,64esab';
    Directory dir = Directory('assets/svg/room_type_icons');
   List<String> svgs =  dir.listSync().map((e) => e.path).toList();
   for (var value in svgs) {
     File file = new File(value);
     Uint8List bytes = file.readAsBytesSync();
     String base64 = base64Encode(bytes);
     String svgSrc = template.replaceAll('64esab', base64);
     File outPut = File(file.path.replaceAll('.svg', '.txt').replaceAll('svg', 'web-svg'));
     outPut.writeAsStringSync(svgSrc);
   }

  });
}