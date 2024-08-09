import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'save_host_value_state.dart';

part 'save_host_value_cubit.freezed.dart';

class SaveHostValueCubit extends Cubit<SaveHostValueState> {
  SaveHostValueCubit() : super(const SaveHostValueState.initial());
  String _hostKey = 'host';
  String _portKey = 'port';

  String? _hostValue;

  void checkHostAtCache() async {
    await Future.delayed(Duration(seconds: 3));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String host = prefs.getString(_hostKey) ?? '';
    int port = prefs.getInt(_portKey) ?? 0;
    if (host.isNotEmpty && port > 0) {
      emit(SaveHostValueState.onSave(host, port));
    } else {
      emit(SaveHostValueState.onEnter());
    }
  }

  void updateHostValue(String newValue) async {
    _hostValue = newValue;
  }

  void saveHost() async {
    bool isOk = true;
    String host = '';
    int port = -1;
    if (_hostValue != null) {
      bool isTwoPoint = _hostValue?.contains(':') ?? false;
      if (!isTwoPoint) {
        return;
      }
      List<String> chunks = _hostValue?.split(':') ?? [];
      if (chunks.length != 2) {
        return;
      }
      port = int.tryParse(chunks[1]) ?? 0;
      if (port == 0) {
        return;
      }
      host = chunks[0];
      bool isPoint = host.contains('.') ?? false;
      if (!isPoint) {
        return;
      }

      chunks = host.split('.');
      if (chunks.length == 4) {
        for (var value in chunks) {
          int? number = int.tryParse(value);
          if (number == null) {
            isOk = false;
            break;
          }
        }
      }
    }

    if (isOk) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(_hostKey, host );
      prefs.setInt(_portKey, port );
      emit(SaveHostValueState.onSave(host, port));
    }
  }
}
