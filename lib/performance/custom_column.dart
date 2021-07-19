import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomColumn extends MultiChildRenderObjectWidget {
  CustomColumn({
    Key? key,
    List<Widget> children = const [],
  }) : super(key: key, children: children);

  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomColumn();
  }
}

class CustomColumnParentData extends ContainerBoxParentData<RenderBox> {
  int? flex;
}

class RenderCustomColumn extends RenderBox
    with
        ContainerRenderObjectMixin<RenderBox, CustomColumnParentData>,
        RenderBoxContainerDefaultsMixin<RenderBox, CustomColumnParentData> {
  @override
  void setupParentData(covariant RenderObject child) {
    if (child.parentData is! CustomColumnParentData)
      child.parentData = CustomColumnParentData();
  }

  @override
  void performLayout() {
    double width = 0, height = 0;

    int totalFlex = 0;
    RenderBox? lastFlexChild;

    //Laying outthe fixed height children.
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;

      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        totalFlex += flex;
        lastFlexChild = child;
      } else {
        child.layout(
          BoxConstraints(maxWidth: constraints.maxWidth),
          parentUsesSize: true,
        );

        height += child.size.height;
        width = max(width, child.size.width);
      }

      child = childParentData.nextSibling;
    }

    //Distributing the remaining height to flex children.
    child = lastFlexChild;
    final flexHeight = (constraints.maxHeight - height) / totalFlex;

    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        final childHeight = flexHeight * flex;
        child.layout(
          BoxConstraints(
            minHeight: childHeight,
            maxHeight: childHeight,
            maxWidth: constraints.maxWidth,
          ),
          parentUsesSize: true,
        );

        height += childHeight;
        width = max(width, child.size.width);
      }

      child = childParentData.previousSibling;
    }

    //Positioning the children.
    child = firstChild;
    var childOffset = Offset.zero;

    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      childParentData.offset = Offset(0, childOffset.dy);

      childOffset += Offset(0, child.size.height);

      child = childParentData.nextSibling;
    }

    size = Size(width, height);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
