import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/utils/string_value.dart';
import 'package:grocery/utils/styles.dart';

class HistoryPage extends StatelessWidget {
  static const String routeNamed = "HistoryPage";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'History',
      body: ListView.builder(
          itemCount: StringValue.HISTORY_OPTIONS_LIST.length,
          itemBuilder: (BuildContext context, index) {
            return CustomButton(
              onTap: () {
                Navigator.pushNamed(
                    context, StringValue.HISTORY_OPTIONS_LIST[index]['route']);
              },
              elevation: 8,
              verticalMargin: 15,
              alignment: MainAxisAlignment.start,
              horizontalMargin: 20,
              text: StringValue.HISTORY_OPTIONS_LIST[index]['title'],
              buttonColor: Styles.WHITE_COLOR,
              textColor: Styles.BLACK_COLOR,
            );
          }),
    );
  }
}
