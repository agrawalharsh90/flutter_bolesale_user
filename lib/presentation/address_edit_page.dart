import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/address.dart';
import 'package:grocery/presentation/custom/custom_button.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/custom_text_field.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/address_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class AddressEditPage extends StatefulWidget {
  static const String routeNamed = 'AddressEditPage';

  @override
  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {
  Address address;

  @override
  Widget build(BuildContext context) {
    if (address == null) {
      address = Provider.of<AddressStore>(context).address;
      if (address == null) address = Address();
    }
    return CustomScaffold(
      appBarTitle: 'Enter Your Delivery Location',
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: ScreenUtil.instance.setWidth(30)),
        child: Column(
          children: <Widget>[
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "Address 1",
              initialValue: address.address1,
              onChanged: (value) {
                setState(() {
                  address.address1 = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "Address 2",
              initialValue: address.address2,
              onChanged: (value) {
                setState(() {
                  address.address2 = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "Region",
              initialValue: address.region,
              onChanged: (value) {
                setState(() {
                  address.region = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "City",
              initialValue: address.city,
              onChanged: (value) {
                setState(() {
                  address.city = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "District",
              initialValue: address.district,
              onChanged: (value) {
                setState(() {
                  address.district = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "State",
              initialValue: address.state,
              onChanged: (value) {
                setState(() {
                  address.state = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "Postal Code",
              textInputType: TextInputType.number,
              initialValue: address.postalCode,
              onChanged: (value) {
                setState(() {
                  address.postalCode = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              fieldHeader: "Country",
              initialValue: address.country,
              onChanged: (value) {
                setState(() {
                  address.country = value;
                });
              },
            ),
            CustomTextField(
              titleColor: Styles.PRIMARY_COLOR,
              textInputType: TextInputType.phone,
              fieldHeader: "Phone Number",
              initialValue: address.phoneNumber,
              onChanged: (value) {
                setState(() {
                  address.phoneNumber = value;
                });
              },
            ),
            StoreObserver<AddressStore>(
              builder: (AddressStore addressStore, BuildContext context) {
                return CustomButton(
                  text: "Save",
                  isLoading: addressStore.isLoading,
                  onTap: () async {
                    await addressStore.updateAddress(address);
                    showToast("Location Recorded");
                    Navigator.pop(context);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
