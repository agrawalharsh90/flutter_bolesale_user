import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/model/product.dart';
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
  int sortBy = 0;

  // 0 none
  // 1 name
  // 2 price

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: ScreenUtil.instance.setWidth(20)),
          icon: Icon(
            Icons.arrow_back,
            color: Styles.WHITE_COLOR,
            size: ScreenUtil.instance.setHeight(32),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Styles.WHITE_COLOR),
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return SimpleDialog(
                        title: Text("Sort By"),
                        children: [
                          sortRadioButton('name', 1, context),
                          sortRadioButton('price: low to high', 2, context),
                          sortRadioButton('price: high to low', 3, context),
                        ],
                      );
                    });
              })
        ],
      ),
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
                    if (sortBy == 3) {
                      widget.productList.sort((a, b) =>
                          int.parse(b.price).compareTo(int.parse(a.price)));
                    } else if (sortBy == 2) {
                      widget.productList.sort((a, b) =>
                          int.parse(a.price).compareTo(int.parse(b.price)));
                    } else if (sortBy == 1) {
                      widget.productList
                          .sort((a, b) => a.product.compareTo(b.product));
                    }
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

  sortRadioButton(String text, int value, context) {
    return InkWell(
      onTap: () {
        setState(() {
          sortBy = value;
        });
        Navigator.pop(context);
      },
      child: Row(
        children: [
          IgnorePointer(
            child: Radio(
              value: value,
              groupValue: sortBy,
              onChanged: (value) {},
              activeColor: Styles.PRIMARY_COLOR,
            ),
          ),
          Container(child: Text(text)),
        ],
      ),
    );
  }
}
