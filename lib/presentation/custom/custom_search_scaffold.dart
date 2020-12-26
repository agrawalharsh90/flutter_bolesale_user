import 'package:flutter/material.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/search_bar.dart';
import 'package:grocery/utils/globals.dart';

class CustomSearchScaffold extends StatefulWidget {
  final Widget body;
  final Function onSearch;
  final Function onBack;
  final String appBarTitle;
  final String hintText;
  final Widget floatingActionButton;
  final IconData icon;
  String searchText;

  CustomSearchScaffold(
      {this.body,
      this.onSearch,
      this.onBack,
      this.appBarTitle = '',
      this.hintText = '',
      this.floatingActionButton,
      this.icon = Icons.search});

  @override
  _CustomSearchScaffoldState createState() => _CustomSearchScaffoldState();
}

class _CustomSearchScaffoldState extends State<CustomSearchScaffold> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      floatingActionButton: widget.floatingActionButton,
      appBarTitle: widget.appBarTitle.isEmpty ? null : widget.appBarTitle,
      onBackPress: widget.searchText == null
          ? widget.onBack
          : () {
              widget.onSearch(null);
            },
      body: Column(
        children: <Widget>[
          SearchBar(
            icon: widget.icon,
            hintText: widget.hintText,
            topPadding: 0,
            verticalMargin: 20,
            horizontalMargin: 20,
            onSearch: (value) {
              print(value);
              setState(() {
                widget.searchText = value;
              });
              widget.onSearch(widget.searchText);
              hideKeyboard(context: context);
            },
          ),
          Expanded(
            child: widget.body,
          )
        ],
      ),
    );
  }
}
