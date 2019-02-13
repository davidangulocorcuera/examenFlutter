import 'package:examen_flutter/detail_page/DetailPage.dart';
import 'package:examen_flutter/model/Category.dart';
import 'package:examen_flutter/my_home_page/MyHomePagePresenter.dart';
import 'package:examen_flutter/my_home_page/MyHomePageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements MyHomePageView{
  List<Category> _categories = [];
  bool _isLoading = true;
  bool _isError = false;
  MyHomePagePresenter _presenter;

  _MyHomePageState() {
    _presenter = MyHomePagePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.fetchData();
  }
  @override
  showError() {
    setState(() {
      _isError = true;
    });
  }

  @override
  showCategories(List<Category> categories) {
    setState(() {
      this._categories = categories;
    });
  }
  @override
  openDetailScreen(Category category) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return DetailPage(category);
    }));
  }
  @override
  showLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  @override
  hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }
  buildBody() {
    if (_isLoading) {
      return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90.0),
            child: CircularProgressIndicator(),
          ));
    }
    else if (_isError) {
      return Center(child: Text("Ha habido un error"));
    } else {
      return RefreshIndicator(
        onRefresh: () {
          _presenter.fetchData();
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return ListTile(
              leading: Icon(Icons.account_circle),
              title:
              Text(_categories[position].question),
              onTap: () {
                _presenter.elementClicked(_categories[position]);
              },
            );
          },
          itemCount: _categories.length,
          reverse: false,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: buildBody(),


    );
  }


}
