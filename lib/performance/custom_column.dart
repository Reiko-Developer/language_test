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

  Size _performeLayout(
      {required BoxConstraints constraints, required bool dry}) {
    double width = 0, height = 0;

    int totalFlex = 0;
    RenderBox? lastFlexChild;

    //Laying out the fixed height children.
    RenderBox? child = firstChild;
    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      final flex = childParentData.flex ?? 0;

      if (flex > 0) {
        totalFlex += flex;
        lastFlexChild = child;
      } else {
        late final Size childSize;
        if (!dry) {
          child.layout(
            BoxConstraints(maxWidth: constraints.maxWidth),
            parentUsesSize: true,
          );

          childSize = child.size;
        } else {
          childSize = child.getDryLayout(
            BoxConstraints(maxWidth: constraints.maxWidth),
          );
        }

        height += childSize.height;
        width = max(width, childSize.width);
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
        late final Size childSize;
        if (!dry) {
          child.layout(
            BoxConstraints(
              minHeight: childHeight,
              maxHeight: childHeight,
              maxWidth: constraints.maxWidth,
            ),
            parentUsesSize: true,
          );

          childSize = child.size;
        } else {
          childSize = child.getDryLayout(
            BoxConstraints(
              minHeight: childHeight,
              maxHeight: childHeight,
              maxWidth: constraints.maxWidth,
            ),
          );
        }

        height += childSize.height;
        width = max(width, childSize.width);
      }

      child = childParentData.previousSibling;
    }

    return Size(width, height);
  }

  @override
  void performLayout() {
    size = _performeLayout(constraints: constraints, dry: false);

    //Positioning the children.
    RenderBox? child = firstChild;
    var childOffset = Offset.zero;

    while (child != null) {
      final childParentData = child.parentData as CustomColumnParentData;
      childParentData.offset = Offset(0, childOffset.dy);

      childOffset += Offset(0, child.size.height);

      child = childParentData.nextSibling;
    }
  }

  //It's not needed in almost cases, but in some cases if you don't implement it your widget will throw error.
  Size computeDryLayout(BoxConstraints constraints) {
    return _performeLayout(constraints: constraints, dry: true);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    defaultPaint(context, offset);
  }
}
