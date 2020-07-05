import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/medical.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/store_observer.dart';
import 'package:grocery/store/medical_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:intl/intl.dart';

class MedicalHistoryPage extends StatelessWidget {
  static const String routeNamed = "MedicalHistoryPage";

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: 'Medical History',
      body: StoreObserver<MedicalStore>(
        builder: (MedicalStore medicalStore, BuildContext context) {
          if (medicalStore.isLoading)
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            );
          if (medicalStore.medicalPrescriptionData.isEmpty)
            return Center(
              child: getTitleTex("No Order Yet"),
            );
          return ListView.builder(
              itemCount: medicalStore.medicalPrescriptionData.length,
              itemBuilder: (BuildContext context, index) {
                List<Medical> medicalList =
                    medicalStore.medicalPrescriptionData.values.toList();
                medicalList.sort((a, b) => b.id.compareTo(a.id));
                return Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenUtil.instance.setWidth(20))),
                  margin: EdgeInsets.symmetric(
                      vertical: ScreenUtil.instance.setHeight(7),
                      horizontal: ScreenUtil.instance.setWidth(20)),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil.instance.setWidth(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Your Prescription: ",
                          style: TextStyle(fontSize: 18),
                        ),
                        CachedNetworkImage(
                          height: ScreenUtil.instance.setHeight(250),
                          imageUrl: medicalList[index].prescriptionUrl,
                          fit: BoxFit.contain,
                          placeholder: (context, s) {
                            return Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Styles.PRIMARY_COLOR),
                              ),
                            );
                          },
                          errorWidget: (context, s, o) {
                            return Center(
                              child: Icon(Icons.error_outline),
                            );
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(DateFormat('dd/MM/yy (hh:mm:ss)').format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    int.parse(medicalList[index].id))))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
