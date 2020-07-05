import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/screen_argument.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/order_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class HelpingHandTypePage extends StatelessWidget {
  static const String routeNamed = 'HelpingHandTypePage';
  String helpingHandTitle;
  List<Vendor> workerList;

  @override
  Widget build(BuildContext context) {
    if (helpingHandTitle == null) {
      ScreenArguments args = ModalRoute.of(context).settings.arguments;
      helpingHandTitle = args.helpingHandTitle;
      workerList = args.workerList;
    }
    return CustomScaffold(
      appBarTitle: helpingHandTitle,
//      hintText: 'Search For ' + helpingHandTitle,
//      onSearch: (value) {},
      body: ListView.builder(
          itemCount: workerList.length,
          itemBuilder: (BuildContext context, index) {
            return CustomButton(
              onTap: () => customWorkerDialog(
                  context: context,
                  worker: workerList[index],
                  buttonText: 'Request',
                  onAdd: (value) {
                    print(value);
                    print("helping ");
                    confirmHelpingHandRequest(workerList[index], context);
                  }),
              elevation: 8,
              imageUrl: workerList[index].imageUrl,
              alignment: MainAxisAlignment.spaceAround,
              verticalMargin: 10,
              horizontalMargin: 20,
              isImageCircle: true,
              text: workerList[index].name,
              buttonColor: Styles.WHITE_COLOR,
              textColor: Styles.BLACK_COLOR,
            );
          }),
    );
  }

  confirmHelpingHandRequest(Vendor selectedVendor, context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            padding: EdgeInsets.symmetric(
                vertical: ScreenUtil.instance.setHeight(10),
                horizontal: ScreenUtil.instance.setWidth(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Your Request",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: ScreenUtil.instance.setHeight(15),
                ),
                Text(
                  helpingHandTitle,
                  style: TextStyle(fontSize: 25),
                ),
                CustomButton(
                  verticalMargin: 20,
                  elevation: 5,
                  imageUrl: selectedVendor == null
                      ? Styles.MO_CONTACT_US
                      : selectedVendor.imageUrl,
                  text: selectedVendor == null
                      ? 'Select Vendors'
                      : selectedVendor.name,
                  textColor: Styles.BLACK_COLOR,
                  isImageCircle: true,
                  buttonColor: Styles.WHITE_COLOR,
                  alignment: MainAxisAlignment.spaceAround,
                  isForwardArrow: false,
                ),
                StoreObserver<OrderStore>(
                  builder: (OrderStore orderStore, BuildContext context) {
                    return CustomButton(
                      isLoading: orderStore.isLoading,
                      onTap: () async {
                        await orderStore.postHelpingHandRequest({
                          'category': helpingHandTitle,
                          'vendor': Vendor.toJson(selectedVendor)
                        });
                        showToast("Your Helping Hand Request Recorded");
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      verticalMargin: 40,
                      text: 'Confirm Request',
                    );
                  },
                ),
              ],
            ),
          ));
        });
  }
}
