import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:viewer_for_stand_v2/models/marker_svg_icon.dart';
import 'package:viewer_for_stand_v2/models/position_3d.dart';
import 'package:viewer_for_stand_v2/models/room_marker.dart';

void main() async {
  test('Read json with point', () async {
    File file1 = File('./assets/jsons/rooms_В_Координация_Этаж 3.json');
    File file2 = File('./assets/jsons/rooms_types.json');


    String json1 = await file1.readAsString();
    String json2 = await file2.readAsString();
    Map<String, dynamic> map1 = jsonDecode(json1);
    Map<String, dynamic> map2 = jsonDecode(json2);
    List<dynamic> collection1 = map1["collection"] as List<dynamic>;
    List<RoomMarker> rms = collection1
        .map((e) => e as Map<String, dynamic>)
        .map((e) {
          String name = e["Name"];
          if (map2.containsKey(name)) {
            int id = e["ElementId"];
            String number = e["Number"];
            List<double> points = (e["MarkerPoint"] as List<dynamic>)
                .map((e) => e as double)
                .toList();
            int type = map2[name];
            Position3D p = Position3D(
                x: points[0] / 1000, y: points[2] / 1000, z: points[1] / 1000);
            return RoomMarker(
              roomRevitId: id,
              position3D: p,
              roomName: name,
              roomNumber: number,
              roomType: type,
              markerSvgIcon: MarkerSvgIcon(srcOff: '', srcOn: ''),
            );
          }
          return null;
        })
        .nonNulls
        .toList();

    List<Map<String, dynamic>> mapOut = rms.map((e) => e.toJson()).toList();
    String jsonOutput = jsonEncode(mapOut);
    File fileOutput = File('jsonOutput.json');
    fileOutput.writeAsString(jsonOutput);
  });
}
