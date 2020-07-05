import 'package:flutter/material.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/search_bar.dart';

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
      this.searchText,
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
      appBarTitle: widget.searchText == null
          ? widget.appBarTitle.isEmpty ? null : widget.appBarTitle
          : null,
      onBackPress: widget.searchText == null
          ? widget.onBack
          : () {
              setState(() {
                widget.searchText = null;
              });
              widget.onSearch(null);
            },
      body: Column(
        children: <Widget>[
          SearchBar(
            icon: widget.icon,
            hintText: widget.hintText,
            initialValue: widget.searchText,
            topPadding: widget.searchText == null ? 0 : 30,
            verticalMargin: widget.searchText == null ? 20 : 0,
            horizontalMargin: widget.searchText == null ? 20 : 0,
            onTap: () {
              setState(() {
                widget.searchText = widget.searchText ?? '';
              });
            },
            onSearch: (value) {
              print(value);
              setState(() {
                widget.searchText = value;
              });
              widget.onSearch(widget.searchText);
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
