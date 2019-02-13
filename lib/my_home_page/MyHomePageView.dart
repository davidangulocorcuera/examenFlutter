import 'package:examen_flutter/model/Category.dart';

abstract class MyHomePageView {

  openDetailScreen(Category category);
  showCategories(List<Category> categories);
  showLoading();
  hideLoading();
  showError();
}
