import 'package:flutter/material.dart';

class DBDashedLine extends StatelessWidget {
  DBDashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 1,
    this.dashedHeight = 1,
    this.count = 10,
    this.color = const Color(0xffff0000),
  });

  // 虚线的方向
  final Axis axis;

  // 根据虚线的方向确定自己虚线的宽度
  final double dashedWidth;

  // 根据虚线的方向确定自己虚线的高度
  final double dashedHeight;

  // 内部会根据设置的个数和宽高确定密度（虚线的空白间隔）
  final int count;

  // 虚线的颜色
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: axis,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(count, (_) {
            return SizedBox(
              width: dashedWidth,
              height: dashedHeight,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}
