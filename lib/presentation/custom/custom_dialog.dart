import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/model/vendor.dart';
import 'package:grocery/utils/styles.dart';

class CustomDialogWidget extends StatefulWidget {
  Product product;
  Vendor worker;
  Function onAdd;
  String buttonText;
  int initialCount;

  CustomDialogWidget(
      {this.product,
      this.worker,
      this.initialCount = 1,
      this.onAdd,
      this.buttonText});

  @override
  _CustomDialogWidgetState createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil.instance.setHeight(10),
            horizontal: ScreenUtil.instance.setWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: ScreenUtil.instance.setHeight(250),
                padding:
                    EdgeInsets.only(bottom: ScreenUtil.instance.setHeight(20)),
                child: CachedNetworkImage(
                  imageUrl: widget.worker == null
                      ? widget.product.imageUrl
                      : widget.worker.imageUrl ?? Styles.MO_CONTACT_US,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, s) {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
                      ),
                    );
                  },
                  errorWidget: (context, s, o) {
                    return Center(
                      child: widget.worker == null
                          ? Icon(Icons.error_outline)
                          : Image.asset(Styles.MO_CONTACT_US),
                    );
                  },
                ),
              ),
              Text(
                  widget.worker == null
                      ? widget.product.name
                      : widget.worker.name,
                  style: TextStyle(color: Styles.PRIMARY_COLOR, fontSize: 20)),
              Text(widget.worker == null
                  ? widget.product.description ?? ''
                  : widget.worker.rating != null
                      ? "Review " + widget.worker.rating + "stars"
                      : ''),
              Text(widget.worker == null ? widget.product.type ?? '' : ''),
              SizedBox(
                height: ScreenUtil.instance.setHeight(20),
              ),
              widget.worker == null
                  ? Text(
                      "Price : Rs." + widget.product.price,
                      style:
                          TextStyle(color: Styles.PRIMARY_COLOR, fontSize: 18),
                    )
                  : SizedBox(),
//              InkWell(
//                      onTap: () => urlLauncher(widget.worker.phone, context),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          Image.asset(
//                            Styles.PHONE_ICON,
//                            height: ScreenUtil.instance.setWidth(40),
//                          ),
//                          Text(widget.worker.phone)
//                        ],
//                      ),
//                    ),
              SizedBox(
                height: ScreenUtil.instance.setHeight(20),
              ),
              widget.worker == null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            if (widget.initialCount < 2) return;
                            setState(() {
                              widget.initialCount--;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ScreenUtil.instance.setWidth(35),
                            height: ScreenUtil.instance.setWidth(35),
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Styles.PRIMARY_COLOR,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(
                                      ScreenUtil.instance.setWidth(5))),
                            ),
                            child: Icon(
                              Icons.remove,
                              color: Styles.WHITE_COLOR,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: ScreenUtil.instance.setWidth(35),
                          height: ScreenUtil.instance.setWidth(35),
                          margin: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: Styles.WHITE_COLOR,
                            border: Border.all(color: Styles.PRIMARY_COLOR),
                          ),
                          child: Text(widget.initialCount.toString()),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              widget.initialCount++;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: ScreenUtil.instance.setWidth(35),
                            height: ScreenUtil.instance.setWidth(35),
                            margin: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Styles.PRIMARY_COLOR,
                              borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(
                                      ScreenUtil.instance.setWidth(5))),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Styles.WHITE_COLOR,
                            ),
                          ),
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: ScreenUtil.instance.setHeight(20),
              ),
              widget.buttonText != null
                  ? RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onAdd(widget.initialCount);
                      },
                      child: Text(
                        widget.buttonText,
                        style:
                            TextStyle(color: Styles.WHITE_COLOR, fontSize: 15),
                      ),
                      color: Styles.PRIMARY_COLOR,
                    )
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
