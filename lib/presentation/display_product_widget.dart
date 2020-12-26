import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/image_preview.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

class DisplayProductWidget extends StatefulWidget {
  Product product;
  String productId;
  String catId;
  String subCatId;
  int initialCount;

  DisplayProductWidget({
    this.product,
    this.productId,
    this.catId,
    this.subCatId,
    this.initialCount = 1,
  });

  @override
  _DisplayProductWidgetState createState() => _DisplayProductWidgetState();
}

class _DisplayProductWidgetState extends State<DisplayProductWidget> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              if (widget.product == null ||
                  widget.product.productID == null ||
                  widget.product.productID.isEmpty) {
                showToast(
                    "Unable to share this product please try after some time");
                Navigator.pop(context);
                return;
              }
              dynamicLinkService.createShareProductLink(
                  productId: widget.product.productID,
                  categoryId: widget.product.category,
                  subCategoryId: widget.product.sub_category);
            },
          )
        ],
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Styles.PRIMARY_COLOR),
              ),
            )
          : Container(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil.instance.setHeight(10),
                  horizontal: ScreenUtil.instance.setWidth(10)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.product.productImage != null &&
                            widget.product.productImage.isNotEmpty
                        ? Container(
                            height: ScreenUtil.instance.setHeight(280),
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.product.productImage.length,
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ImagePreview(
                                                    imgUrl: widget.product
                                                        .productImage[index],
                                                  )));
                                    },
                                    child: Container(
                                      width: ScreenUtil.instance
                                          .setWidth(ScreenUtil.instance.width),
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              ScreenUtil.instance.setWidth(15)),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            widget.product.productImage[index],
                                        fit: BoxFit.contain,
                                        placeholder: (context, s) {
                                          return Center(
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Styles.PRIMARY_COLOR),
                                            ),
                                          );
                                        },
                                        errorWidget: (context, s, o) {
                                          return Center(
                                              child: Icon(Icons.error_outline));
                                        },
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : SizedBox(),
                    Divider(),
                    Text(widget.product.product,
                        style:
                            TextStyle(color: Styles.BLACK_COLOR, fontSize: 20)),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(10),
                    ),
                    getDetailsRow("Price", "Rs." + widget.product.price),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(20),
                    ),
                    Text(
                      "Quantity : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            if (widget.initialCount <=
                                int.parse(widget.product.moq)) return;
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
                          constraints: BoxConstraints(
                            minWidth: ScreenUtil.instance.setWidth(70),
                          ),
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
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(20),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        onPressed: () {
                          if (widget.product.productID == null ||
                              widget.product.productID.isEmpty) {
                            showToast(
                                "Unable to add this product please try after some time");
                            Navigator.pop(context);
                            return;
                          }
                          Navigator.pop(context);
                          widget.product.quantity = widget.initialCount;
                          Provider.of<CartStore>(context).updateCartMap({
                            widget.product.category: {
                              widget.product.productID: widget.product
                            }
                          });
                        },
                        child: Text(
                          'Add To Cart',
                          style: TextStyle(
                              color: Styles.WHITE_COLOR, fontSize: 15),
                        ),
                        color: Styles.PRIMARY_COLOR,
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil.instance.setHeight(10),
                    ),
                    getDetailsRow("MOQ", widget.product.moq),
                    getDetailsRow("Material", widget.product.material),
                    getDetailsRow("Size", widget.product.size),
                    getDetailsRow("MRP", widget.product.mrp),
                    getDetailsRow("Dispatch in Days", widget.product.dispatch),
                    getDetailsRow("Brand", widget.product.brand),
                    getDetailsRow("Warranty", widget.product.warranty),
                    getDetailsRow("Origin", widget.product.origin),
                    getDetailsRow("Description", widget.product.description),
                  ],
                ),
              ),
            ),
    );
  }

  getDetailsRow(String title, String value) {
    return Column(
      children: <Widget>[
        Divider(),
        Row(
          children: <Widget>[
            Container(
              width: ScreenUtil.instance.setWidth(150),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Container(
              width: ScreenUtil.instance.setWidth(150),
              child: Text(
                value ?? '',
              ),
            )
          ],
        ),
        Divider(),
      ],
    );
  }
}
