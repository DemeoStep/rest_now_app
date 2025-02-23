// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static String m0(state) => "Massage is ${state}";

  static String m1(process) => "Failed to ${process}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "lastPayment": MessageLookupByLibrary.simpleMessage("Last payment"),
    "massageState": m0,
    "networkError": MessageLookupByLibrary.simpleMessage(
      "Sorry, we\'re having trouble connecting. Please check your internet connection and try again.\nReach out to support if you continue to experience issues.",
    ),
    "pay": MessageLookupByLibrary.simpleMessage("Pay"),
    "paymentFailed": MessageLookupByLibrary.simpleMessage("Payment Failed"),
    "paymentSuccess": MessageLookupByLibrary.simpleMessage(
      "Payment Successful",
    ),
    "processError": m1,
    "serverError": MessageLookupByLibrary.simpleMessage(
      "Looks like we ran into an issue while processing this request. Please try again.\nReach out to support if you continue to experience issues.",
    ),
    "startMassage": MessageLookupByLibrary.simpleMessage("Start massage"),
    "started": MessageLookupByLibrary.simpleMessage("started"),
    "stopMassage": MessageLookupByLibrary.simpleMessage("Stop massage"),
    "stopped": MessageLookupByLibrary.simpleMessage("stopped"),
    "storageError": MessageLookupByLibrary.simpleMessage(
      "Looks like we ran into an issue with storage. Please try again.\nReach out to support if you continue to experience issues.",
    ),
    "unknownError": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred. Please try again.\nReach out to support if you continue to experience issues.",
    ),
  };
}
