import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/request.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/request_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

import 'custom/custom_text_field.dart';

class CreateRequest extends StatefulWidget {
  @override
  _CreateRequestState createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  Map<String, dynamic> _body = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'New Request',
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          key: Key('DETAILS'),
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.instance.setWidth(30)),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(50),
                    ),
                    CustomTextField(
                      fieldHeader: 'Order Id',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        _body.addAll({"orderId": value});
                      },
                      validators: (value) {
                        if (requiredString(value)) return null;
                        return "Required Field";
                      },
                    ),
                    CustomTextField(
                      fieldHeader: 'Reason',
                      textInputType: TextInputType.text,
                      onChanged: (value) {
                        _body.addAll({"reason": value});
                      },
                      validators: (value) {
                        if (requiredString(value)) return null;
                        return "Required Field";
                      },
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: ScreenUtil.instance.setHeight(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil.instance.setWidth(25)),
                            child: Text('Request Type',
                                style: TextStyle(
                                    fontSize: 16, color: Styles.BLACK_COLOR)),
                          ),
                          SizedBox(
                            height: ScreenUtil.instance.setHeight(15),
                          ),
                          Container(
                            constraints: BoxConstraints(
                              minHeight: ScreenUtil.instance.setHeight(50.0),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: ScreenUtil.instance.setWidth(30.0),
                            ),
                            decoration: BoxDecoration(
                                color: Styles.WHITE_COLOR,
                                border: Border.all(color: Styles.PRIMARY_COLOR),
                                boxShadow: kElevationToShadow[4]),
                            child: DropdownButtonFormField<String>(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              items: RequestType.values
                                  .toList()
                                  .map((RequestType value) {
                                return DropdownMenuItem<String>(
                                  value: describeEnum(value),
                                  child: Text(describeEnum(value)),
                                );
                              }).toList(),
                              onChanged: (value) {
                                _body.addAll({"requestType": value});
                              },
                              validator: (value) {
                                if (requiredString(value)) return null;
                                return "Required Field";
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(80),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.instance.setWidth(30)),
              child: StoreObserver<RequestStore>(
                builder: (RequestStore requestStore, BuildContext context) {
                  return CustomButton(
                    isLoading: requestStore.isLoading,
                    text: 'Submit',
                    fontSize: 20,
                    borderRadius: 5,
                    onTap: () async {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        try {
                          await requestStore.postRequest(_body);
                          Navigator.pop(context);
                        } catch (e) {
                          print("error in request");
                          print(e);
                          showSnackbar(e, context);
                        }
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
