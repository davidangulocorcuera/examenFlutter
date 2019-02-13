import 'package:examen_flutter/model/Category.dart';

abstract class MyHomePageView {
  openDetailScreen(int position);

  showCategories(List<Category> categories);

  showLoading();

  hideLoading();

  showError();
}