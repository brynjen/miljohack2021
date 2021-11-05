// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a nb locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'nb';

  static String m0(name) => "Hei ${name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "change_name": MessageLookupByLibrary.simpleMessage("Endre navn"),
        "delete": MessageLookupByLibrary.simpleMessage("Slett"),
        "environment_package_description": MessageLookupByLibrary.simpleMessage(
            "Denne pakken kan leveres sammen med andre pakker du har på vei. Da sparer du miljøet og tjener Miljøpoeng!"),
        "environment_stuff_message": MessageLookupByLibrary.simpleMessage(
            "Her er masse nyttig om miljø ting"),
        "environment_stuff_title":
            MessageLookupByLibrary.simpleMessage("Detaljer"),
        "from_me": MessageLookupByLibrary.simpleMessage("FRA MEG"),
        "greet_user": m0,
        "make_my_package_environment": MessageLookupByLibrary.simpleMessage(
            "Ja takk, gjør pakken min mer bærekraftig"),
        "make_package_environment":
            MessageLookupByLibrary.simpleMessage("Gjør pakken bærekraftig!"),
        "move_to_sent": MessageLookupByLibrary.simpleMessage("Flytt til sendt"),
        "my_packages": MessageLookupByLibrary.simpleMessage("Mine pakker"),
        "package_details":
            MessageLookupByLibrary.simpleMessage("Detaljer på pakken"),
        "package_ordered":
            MessageLookupByLibrary.simpleMessage("Frakt er bestilt"),
        "profile": MessageLookupByLibrary.simpleMessage("Profil"),
        "read_more_about_environment": MessageLookupByLibrary.simpleMessage(
            "Her kan du lese mer om bærekraftig frakt"),
        "send": MessageLookupByLibrary.simpleMessage("Sende"),
        "share_package": MessageLookupByLibrary.simpleMessage("Del pakke"),
        "thank_you": MessageLookupByLibrary.simpleMessage(
            "Takk for at du handler bærekraftig - her kan du se topplisten og hvordan du og naboene dine ligger an. Spre ryktet :)"),
        "to_me": MessageLookupByLibrary.simpleMessage("TIL MEG"),
        "you_are_not_sending":
            MessageLookupByLibrary.simpleMessage("Du sender ingen pakker")
      };
}
