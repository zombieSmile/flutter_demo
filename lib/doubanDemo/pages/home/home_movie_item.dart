import 'package:flutter/material.dart';
import 'package:flutter_demo/doubanDemo/widget/dashed_line.dart';
import 'package:flutter_demo/doubanDemo/widget/star_rating.dart';
import '../model/home_model.dart';

class DBHomeMovieItem extends StatelessWidget {
  DBHomeMovieItem(this.movieItem);

  final MovieItem movieItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 8,
            color: Color(0xffe2e2e2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getMovieRankWidget(),
          SizedBox(height: 12),
          getMovieContentWidget(),
          SizedBox(height: 12),
          getMovieIntroduceWidget(),
        ],
      ),
    );
  }

  // 电影排名
  Widget getMovieRankWidget() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Color.fromARGB(255, 238, 205, 144),
      ),
      padding: EdgeInsets.fromLTRB(9, 4, 9, 4),
      child: Text(
        'No.${movieItem.rank}',
        style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }

  // 具体内容
  Widget getMovieContentWidget() {
    return Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getContentImage(),
          getContentDesc(),
          getDashLine(),
          getContentWish(),
        ],
      ),
    );
  }

  // 内容图片
  Widget getContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.network(movieItem.imageURL),
    );
  }

  // 内容信息
  Widget getContentDesc() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            getTitleWidget(),
            getRatingWidget(),
            getInfoWidget(),
          ],
        ),
      ),
    );
  }

  Widget getTitleWidget() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_filled,
              color: Colors.redAccent,
            ),
            baseline: TextBaseline.alphabetic,
            alignment: PlaceholderAlignment.middle,
          ),
          TextSpan(
            children: [
              TextSpan(
                text: movieItem.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: movieItem.playDate,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget getRatingWidget() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DBStarRating(rating: movieItem.rating, starSize: 18),
        SizedBox(width: 5),
        Text('${movieItem.rating}'),
      ],
    );
  }

  Widget getInfoWidget() {
    final genres = movieItem.genres.join(' ');
    final director = movieItem.director.name;
    var castString = movieItem.casts.map((item) => item.name).join('');
    return Text(
      '$genres / $director / $castString',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 15),
    );
  }

  Widget getDashLine() {
    return Container(
      width: 1,
      height: 100,
      child: DBDashedLine(
        axis: Axis.vertical,
        dashedHeight: 6,
        dashedWidth: .5,
        count: 12,
        color: Colors.black54,
      ),
    );
  }

  Widget getContentWish() {
    return Container(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Image.asset('assets/images/home/wish.png', width: 30),
          SizedBox(height: 5),
          Text(
            '想看',
            style: TextStyle(
                fontSize: 16, color: Color.fromARGB(255, 235, 170, 60)),
          ),
        ],
      ),
    );
  }

  // 电影简介
  Widget getMovieIntroduceWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        movieItem.originalTitle,
        style: TextStyle(fontSize: 18, color: Colors.black54),
      ),
    );
  }
}
