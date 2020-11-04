import 'package:flutter/material.dart';

class DBStarRating extends StatefulWidget {
  DBStarRating({
    @required this.rating,
    this.maxRating = 10.0,
    this.starCount = 5,
    this.starSize = 30,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    Widget unselectedImage,
    Widget selectedImage,
  })  : unselectedImage = unselectedImage ??
            Icon(Icons.star_border, color: unSelectedColor, size: starSize),
        selectedImage = selectedImage ??
            Icon(Icons.star, color: selectedColor, size: starSize);

  // 必传参数，告诉Widget当前的评分
  final double rating;

  // 可选参数，最高评分，根据它来计算一个比例，默认值为10
  final double maxRating;

  // 展示星星的个数
  final int starCount;

  // 星星的大小，决定每一个star的大小
  final double starSize;

  // 星星未选中时的颜色
  final Color unSelectedColor;

  // 星星选中时的颜色
  final Color selectedColor;

  // 定制未选中的star
  final Widget unselectedImage;

  // 定义选中时的star
  final Widget selectedImage;

  @override
  _DBStarRatingState createState() => _DBStarRatingState();
}

class _DBStarRatingState extends State<DBStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: getUnSelectImage()),
        Row(mainAxisSize: MainAxisSize.min, children: getSelectImage())
      ],
    );
  }

  List<Widget> getUnSelectImage() {
    return List.generate(widget.starCount, (index) => widget.unselectedImage);
  }

  List<Widget> getSelectImage() {
    // 1.计算Star个数和剩余比例
    double oneValue = widget.maxRating / widget.starCount;
    int entireCount = (widget.rating / oneValue).floor();
    double leftValue = widget.rating - entireCount * oneValue;
    double leftRatio = leftValue / oneValue;

    // 2.获取start
    List<Widget> selectedImages = [];
    for (int i = 0; i < entireCount; i++) {
      selectedImages.add(widget.selectedImage);
    }

    // 3.计算
    Widget leftStar = ClipRect(
      clipper: DBStarClipper(width: leftRatio * widget.starSize),
      child: widget.selectedImage,
    );
    selectedImages.add(leftStar);

    return selectedImages;
  }
}

class DBStarClipper extends CustomClipper<Rect> {
  final double width;

  DBStarClipper({this.width});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(DBStarClipper oldClipper) {
    return width != oldClipper.width;
  }
}
