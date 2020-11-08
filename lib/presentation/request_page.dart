import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/presentation/create_request.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/request_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class RequestPage extends StatelessWidget {
  static const String routeNamed = 'RequestPage';

  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Requests',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => CreateRequest()));
        },
        child: Icon(
          Icons.add,
          color: Styles.WHITE_COLOR,
        ),
        backgroundColor: Styles.PRIMARY_COLOR,
      ),
      body: StoreObserver<RequestStore>(
        builder: (RequestStore requestStore, BuildContext context) {
          return dataWidget(requestStore);
        },
      ),
    );
  }

  dataWidget(RequestStore requestStore) {
    if (requestStore.isLoading)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
        ),
      );
    if (requestStore.requests.isEmpty)
      return Center(
        child: getTitleTex('No Request added', textAlign: TextAlign.center),
      );
    return ListView.builder(
        shrinkWrap: true,
        itemCount: requestStore.requests.length,
        controller: _scrollController,
        itemBuilder: (BuildContext context, index) {
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(ScreenUtil.instance.setWidth(20))),
            margin: EdgeInsets.symmetric(
                vertical: ScreenUtil.instance.setHeight(7),
                horizontal: ScreenUtil.instance.setWidth(20)),
            child: Container(
              padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Request Id :" +
                        requestStore.requests.values.toList()[index].id,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "For Order Id :" +
                        requestStore.requests.values.toList()[index].orderId,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Request Type :" +
                        describeEnum(requestStore.requests.values
                            .toList()[index]
                            .requestType),
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Reason :" +
                        requestStore.requests.values.toList()[index].reason,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
