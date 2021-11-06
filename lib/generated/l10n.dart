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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Change name`
  String get change_name {
    return Intl.message(
      'Change name',
      name: 'change_name',
      desc: '',
      args: [],
    );
  }

  /// `Share package`
  String get share_package {
    return Intl.message(
      'Share package',
      name: 'share_package',
      desc: '',
      args: [],
    );
  }

  /// `Move to sent`
  String get move_to_sent {
    return Intl.message(
      'Move to sent',
      name: 'move_to_sent',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `TO ME`
  String get to_me {
    return Intl.message(
      'TO ME',
      name: 'to_me',
      desc: '',
      args: [],
    );
  }

  /// `FROM ME`
  String get from_me {
    return Intl.message(
      'FROM ME',
      name: 'from_me',
      desc: '',
      args: [],
    );
  }

  /// `My packages`
  String get my_packages {
    return Intl.message(
      'My packages',
      name: 'my_packages',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Package details`
  String get package_details {
    return Intl.message(
      'Package details',
      name: 'package_details',
      desc: '',
      args: [],
    );
  }

  /// `Package is ordered`
  String get package_ordered {
    return Intl.message(
      'Package is ordered',
      name: 'package_ordered',
      desc: '',
      args: [],
    );
  }

  /// `You are not sending packages`
  String get you_are_not_sending {
    return Intl.message(
      'You are not sending packages',
      name: 'you_are_not_sending',
      desc: '',
      args: [],
    );
  }

  /// `Make the package environmentally friendly!`
  String get make_package_environment {
    return Intl.message(
      'Make the package environmentally friendly!',
      name: 'make_package_environment',
      desc: '',
      args: [],
    );
  }

  /// `This package can be delivered with other packages you have on the way. You'll save the climate and earn environment points!`
  String get environment_package_description {
    return Intl.message(
      'This package can be delivered with other packages you have on the way. You\'ll save the climate and earn environment points!',
      name: 'environment_package_description',
      desc: '',
      args: [],
    );
  }

  /// `Yes please, make my package environmentally friendly`
  String get make_my_package_environment {
    return Intl.message(
      'Yes please, make my package environmentally friendly',
      name: 'make_my_package_environment',
      desc: '',
      args: [],
    );
  }

  /// `Read more about environmentally friendly deliveries here`
  String get read_more_about_environment {
    return Intl.message(
      'Read more about environmentally friendly deliveries here',
      name: 'read_more_about_environment',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get environment_stuff_title {
    return Intl.message(
      'Details',
      name: 'environment_stuff_title',
      desc: '',
      args: [],
    );
  }

  /// `Here is a lot of stuff about environment`
  String get environment_stuff_message {
    return Intl.message(
      'Here is a lot of stuff about environment',
      name: 'environment_stuff_message',
      desc: '',
      args: [],
    );
  }

  /// `Hello {name}`
  String greet_user(Object name) {
    return Intl.message(
      'Hello $name',
      name: 'greet_user',
      desc: '',
      args: [name],
    );
  }

  /// `Thank you for acting environmentally - here you can see the toplist and how you and your neighbors are doing. Spread the rumor :)`
  String get thank_you {
    return Intl.message(
      'Thank you for acting environmentally - here you can see the toplist and how you and your neighbors are doing. Spread the rumor :)',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }

  /// `So nice of you to shop environmentally! Here you can see the points you've earned by helping us reduce resource use.`
  String get helpful_text {
    return Intl.message(
      'So nice of you to shop environmentally! Here you can see the points you\'ve earned by helping us reduce resource use.',
      name: 'helpful_text',
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
      Locale.fromSubtags(languageCode: 'nb'),
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
