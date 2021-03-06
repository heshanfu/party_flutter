import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get tutorialSkip {
    return Intl.message(
      'Play',
      name: 'tutorialSkip',
      desc: 'Button which skips the tutorial and takes the player to the game',
    );
  }

  String get tutorialFirstSectionHeader {
    return Intl.message(
      'Friends',
      name: 'tutorialFirstSectionHeader',
      desc: 'Header for the first tutorial section',
    );
  }

  String get tutorialFirstSectionDescription {
    return Intl.message(
      'Gather a groups of friends and sit together. Youngest player starts.',
      name: 'tutorialFirstSectionDescription',
      desc: 'Description for the first tutorial section',
    );
  }

  String get tutorialSecondSectionHeader {
    return Intl.message(
      'Category',
      name: 'tutorialSecondSectionHeader',
      desc: 'Header for the second tutorial section',
    );
  }

  String get tutorialSecondSectionDescription {
    return Intl.message(
      'Select the category and place the phone on forehead. Guess the word with friends help.',
      name: 'tutorialSecondSectionDescription',
      desc: 'Description for the second tutorial section',
    );
  }

  String get tutorialThirdSectionHeader {
    return Intl.message(
      'Fun!',
      name: 'tutorialThirdSectionHeader',
      desc: 'Header for the third tutorial section',
    );
  }

  String get tutorialThirdSectionDescription {
    return Intl.message(
      'Tap the screen once if you want to pass, and tap it twice when correctly guessed. Good luck!',
      name: 'tutorialThirdSectionDescription',
      desc: 'Description for the third tutorial section',
    );
  }

  String get preparationFirstTip {
    return Intl.message(
      'Place the phone on the forehead and guess the displayed word with help of your friends.',
      name: 'preparationFirstTip',
      desc: 'First tip for reminding player on how to play the game',
    );
  }

  String get preparationSecondTip {
    return Intl.message(
      'Tap the screen once if you want to pass, and tap it twice when correctly guessed.',
      name: 'preparationSecondTip',
      desc: 'Second tip for reminding player on how to play the game',
    );
  }

  String get preparationPlay {
    return Intl.message(
      'Play',
      name: 'preparationPlay',
      desc:
          'Button which confirms the selected category and starts the main game',
    );
  }

  String get moreQuestionsAvailable {
    return Intl.message(
      'and a lot more',
      name: 'moreQuestionsAvailable',
      desc:
      'Text indicating that there are lot more questions available in given category',
    );
  }

  String get preparationBack {
    return Intl.message(
      'Back',
      name: 'preparationBack',
      desc:
          'Button which discards current category and takes the player back to the category listing',
    );
  }

  String get gameCancelConfirmation {
    return Intl.message(
      'Do you want to cancel the current game?',
      name: 'gameCancelConfirmation',
      desc:
          'Description of the dialog which is presented to the player when he tries to quit the game loop',
    );
  }

  String get gameCancelApprove {
    return Intl.message(
      'OK',
      name: 'gameCancelApprove',
      desc: 'Text for approving the decision to cancel current game.',
    );
  }

  String get gameCancelDeny {
    return Intl.message(
      'Cancel',
      name: 'gameCancelDeny',
      desc: 'Text for canceling the decision to cancel current game.',
    );
  }

  String get nextQuestion {
    return Intl.message(
      'Next',
      name: 'nextQuestion',
      desc: 'Text shown before presenting next question during the game',
    );
  }

  String get summaryHeader {
    return Intl.message(
      'Your score',
      name: 'summaryHeader',
      desc:
      'Header displayed at the top of summary screen, informing player about current score',
    );
  }

  String get summaryBack {
    return Intl.message(
      'Back',
      name: 'summaryBack',
      desc:
          'Button which takes the player from summary screen to category listing',
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pl'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
