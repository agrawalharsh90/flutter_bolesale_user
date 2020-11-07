import 'package:flutter/material.dart';
import 'package:grocery/model/product.dart';
import 'package:grocery/presentation/custom/custom_scaffold.dart';
import 'package:grocery/presentation/custom/image_card.dart';
import 'package:grocery/store/cart_store.dart';
import 'package:grocery/utils/globals.dart';
import 'package:grocery/utils/styles.dart';
import 'package:provider/provider.dart';

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
          if (widget.productList.length > (length + 10))
            setState(() {
              length = length + 10;
            });
        } else {
          setState(() {
            length = widget.productList.length;
          });
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
                    return ImageCard(
                      onTap: () => customProductDialog(
                          context: context,
                          product: widget.productList[index],
                          onAdd: (value) {
                            print("on Add " + value.toString());
                            Product product = widget.productList[index];
                            product.quantity = value;
                            Provider.of<CartStore>(context).updateCartMap({
                              "Clothes": {product.sellerId: product}
                            });
                          }),
                      imgUrl: widget.productList[index].productImage != null &&
                              widget.productList[index].productImage.isNotEmpty
                          ? widget.productList[index].productImage[0]
                          : Styles.APP_LOGO,
                      imagePadding: 0,
                      width: 100,
                      verticalMargin: 10,
                      cardColor: Styles.WHITE_COLOR,
                      color: Styles.TRANSPARENT_COLOR,
                      textColor: Styles.BLACK_COLOR,
                      shownForwardArrow: false,
                      text: widget.productList[index].product,
                      boxFit: BoxFit.contain,
                    );
                  }),
            ),
    );
  }
}
