// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a uk locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'uk';

  static String m0(state) => "Масаж ${state}";

  static String m1(process) => "Не вдалося ${process}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "error": MessageLookupByLibrary.simpleMessage("Помилка"),
    "lastPayment": MessageLookupByLibrary.simpleMessage("Остання оплата"),
    "massageState": m0,
    "networkError": MessageLookupByLibrary.simpleMessage(
      "Вибачте, у нас виникли проблеми з підключенням. Будь ласка, перевірте підключення до Інтернету та спробуйте ще раз.\nЗверніться до служби підтримки, якщо проблема не зникає.",
    ),
    "pay": MessageLookupByLibrary.simpleMessage("Оплатити"),
    "paymentFailed": MessageLookupByLibrary.simpleMessage("Оплата не вдалася"),
    "paymentSuccess": MessageLookupByLibrary.simpleMessage("Оплата успішна"),
    "processError": m1,
    "serverError": MessageLookupByLibrary.simpleMessage(
      "Здається, під час обробки цього запиту сталася помилка. Будь ласка, спробуйте ще раз.\nЗверніться до служби підтримки, якщо проблема не зникає.",
    ),
    "startMassage": MessageLookupByLibrary.simpleMessage("Почати масаж"),
    "started": MessageLookupByLibrary.simpleMessage("почато"),
    "stopMassage": MessageLookupByLibrary.simpleMessage("Зупинити масаж"),
    "stopped": MessageLookupByLibrary.simpleMessage("зупинено"),
    "storageError": MessageLookupByLibrary.simpleMessage(
      "Здається, у нас виникла проблема зі сховищем. Будь ласка, спробуйте ще раз.\nЗверніться до служби підтримки, якщо проблема не зникає.",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "Сталася невідома помилка. Будь ласка, спробуйте ще раз.\nЗверніться до служби підтримки, якщо проблема не зникає.",
    ),
  };
}
