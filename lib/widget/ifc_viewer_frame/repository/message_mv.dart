import 'dart:convert';

class MessageMV {
  final Map<String, dynamic> message;

  MessageMV.toMessage({required MessageTypeMV typeMV, Map<String, dynamic>? body})
      : message = {
          'type': typeMV.api,
          if (body != null) 'body': body,
        };

  MessageMV.fromMessage(String message) : message = jsonDecode(message);
}

enum MessageTypeMV {
   ///Передать конфиг файл
  postConfigMV('post_config_mv'),

  ///Модель во вьювере загружена
  postModelLoadedVM('post_model_loaded_vm'),

  ///Передать информацию о выбранном маркере на моделе во вьювере
  postSelectMarkVM('post_select_mark_vm'),

  undef('undef');
  const MessageTypeMV(this.api);

  final String api;

  static MessageTypeMV findBy(String name){
    return MessageTypeMV.values.where((element) => element.api == name).firstOrNull ?? MessageTypeMV.undef;
  }
}
