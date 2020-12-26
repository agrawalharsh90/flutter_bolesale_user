import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';

class DisplayProductList extends StatefulWidget {
  String title;
  List<Product> productList;

  DisplayProductList({this.title, this.productList});

  @override
  _DisplayProductListState createState() => _DisplayProductListState();
}

class _DisplayProductListState extends State<DisplayProductList> {
  ScrollController _scrollController = ScrollController();
  int length;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.position.pixels) {
        if (widget.productList.length > length) {
          if (widget.productList.length > (length + 10)) {
            setState(() {
              length = length + 10;
            });
          } else {
            setState(() {
              length = widget.productList.length;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (length == null) {
      if (widget.productList.length < 10) {
        length = widget.productList.length;
      } else {
        length = 10;
      }
    }
    return CustomScaffold(
      appBarTitle: widget.title,
      body: widget.productList.isEmpty
          ? Center(
              child: getTitleTex("No Items",
                  fontSize: 14, textAlign: TextAlign.center),
            )
          : Container(
              child: ListView.builder(
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil.instance
                              .setHeight(index == 0 ? 10 : 0),
                        ),
                        InkWell(
                          onTap: () => navigateToDisplayProductWidget(
                            context: context,
                            product: widget.productList[index],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: ScreenUtil.instance.setWidth(100),
                                height: ScreenUtil.instance.setWidth(100),
                                child: imageWidget(
                                  imgUrl:
                                      widget.productList[index].productImage !=
                                                  null &&
                                              widget.productList[index]
                                                  .productImage.isNotEmpty
                                          ? widget.productList[index]
                                              .productImage[0]
                                          : Styles.APP_LOGO,
                                ),
                              ),
                              Container(
                                width: ScreenUtil.instance.setWidth(300),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.productList[index].product,
                                        style: TextStyle(
                                            color: Styles.BLACK_COLOR,
                                            fontSize: 20)),
                                    Text(
                                        'Rs.' + widget.productList[index].price,
                                        style:
                                            TextStyle(color: Styles.RED_COLOR)),
                                    Text(
                                        'MOQ: ' + widget.productList[index].moq,
                                        style: TextStyle(
                                            color: Styles.BLACK_COLOR)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
    );
  }
}
