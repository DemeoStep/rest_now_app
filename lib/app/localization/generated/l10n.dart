// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Last payment`
  String get lastPayment {
    return Intl.message(
      'Last payment',
      name: 'lastPayment',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed`
  String get paymentFailed {
    return Intl.message(
      'Payment Failed',
      name: 'paymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Payment Successful`
  String get paymentSuccess {
    return Intl.message(
      'Payment Successful',
      name: 'paymentSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Massage is {state}`
  String massageState(Object state) {
    return Intl.message(
      'Massage is $state',
      name: 'massageState',
      desc: '',
      args: [state],
    );
  }

  /// `started`
  String get started {
    return Intl.message('started', name: 'started', desc: '', args: []);
  }

  /// `stopped`
  String get stopped {
    return Intl.message('stopped', name: 'stopped', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Stop massage`
  String get stopMassage {
    return Intl.message(
      'Stop massage',
      name: 'stopMassage',
      desc: '',
      args: [],
    );
  }

  /// `Start massage`
  String get startMassage {
    return Intl.message(
      'Start massage',
      name: 'startMassage',
      desc: '',
      args: [],
    );
  }

  /// `Failed to {process}`
  String processError(Object process) {
    return Intl.message(
      'Failed to $process',
      name: 'processError',
      desc: '',
      args: [process],
    );
  }

  /// `Looks like we ran into an issue while processing this request. Please try again.\nReach out to support if you continue to experience issues.`
  String get serverError {
    return Intl.message(
      'Looks like we ran into an issue while processing this request. Please try again.\nReach out to support if you continue to experience issues.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, we're having trouble connecting. Please check your internet connection and try again.\nReach out to support if you continue to experience issues.`
  String get networkError {
    return Intl.message(
      'Sorry, we\'re having trouble connecting. Please check your internet connection and try again.\nReach out to support if you continue to experience issues.',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Looks like we ran into an issue with storage. Please try again.\nReach out to support if you continue to experience issues.`
  String get storageError {
    return Intl.message(
      'Looks like we ran into an issue with storage. Please try again.\nReach out to support if you continue to experience issues.',
      name: 'storageError',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred. Please try again.\nReach out to support if you continue to experience issues.`
  String get unknownError {
    return Intl.message(
      'An unknown error occurred. Please try again.\nReach out to support if you continue to experience issues.',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'uk'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
