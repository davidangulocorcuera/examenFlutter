import 'dart:convert';

import 'package:examen_flutter/model/Category.dart';
import 'package:examen_flutter/my_home_page/MyHomePageView.dart';
import 'package:http/http.dart' as network;


class MyHomePagePresenter{
  MyHomePageView _view;
  MyHomePagePresenter(this._view);
  fetchData() async {
    _view.showLoading();
    network.Response response =
    await network.get('https://opentdb.com/api.php?amount=10');
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      List<Category> categories = jsonBody['results'].map<Category>((element) {
        String question = element['question'];
        String correct_answer = element['correct_answer'];
        List<dynamic> incorrect_answers = element['incorrect_answers'];

        return Category(question,correct_answer,incorrect_answers);
      }).toList();
      _view.showCategories(categories);
    } else {
      _view.showError();
    }
    _view.hideLoading();
  }

  elementClicked(int position) {
    _view.openDetailScreen(position);
  }
}