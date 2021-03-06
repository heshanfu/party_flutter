import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:zgadula/localizations.dart';
import 'package:zgadula/screens/tutorial.dart';
import 'package:zgadula/screens/home.dart';
import 'package:zgadula/store/category.dart';
import 'package:zgadula/store/question.dart';
import 'package:zgadula/store/tutorial.dart';

CategoryModel categoryModel;
QuestionModel questionModel;
TutorialModel tutorialModel;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (categoryModel == null) {
      categoryModel = CategoryModel();
      categoryModel.initialize();
    }

    if (questionModel == null) {
      questionModel = QuestionModel();
      questionModel.initialize();
    }

    if (tutorialModel == null) {
      tutorialModel = TutorialModel();
      tutorialModel.initialize();
    }

    return ScopedModel<CategoryModel>(
      model: categoryModel,
      child: ScopedModel<QuestionModel>(
        model: questionModel,
        child: ScopedModel<TutorialModel>(
          model: tutorialModel,
          child: buildApp(context),
        ),
      ),
    );
  }

  Widget buildApp(BuildContext context) {
    return MaterialApp(
      title: 'Zgadula',
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('pl', 'PL'),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColorDark: Color(0xFF455A64),
        primaryColorLight: Color(0xFFCFD8DC),
        primaryColor: Color(0xFF607D8B),
        accentColor: Color(0xFF4CAF50),
        iconTheme: IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        dividerColor: Color(0xFFBDBDBD),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Color(0xFFEEEEEE),
              displayColor: Color(0xFF757575),
            ),
        buttonTheme: ButtonThemeData(
          height: 52.0,
          minWidth: 120.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      home: ScopedModelDescendant<TutorialModel>(
        builder: (context, child, model) =>
            model.isWatched ? HomeScreen() : TutorialScreen(),
      ),
    );
  }
}

void main() => runApp(App());
