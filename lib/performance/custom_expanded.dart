import 'package:flutter/material.dart';
import 'package:language_test/performance/custom_column.dart';

class CustomExpanded extends ParentDataWidget<CustomColumnParentData> {
  const CustomExpanded({Key? key, this.flex = 1, required Widget child})
      : assert(flex > 0),
        super(key: key, child: child);
  final int flex;

  void applyParentData(RenderObject renderObject) {
    final parentData = renderObject.parentData as CustomColumnParentData;

    if (parentData.flex != flex) {
      parentData.flex = flex;

      final targetObject = renderObject.parent;

      if (targetObject is RenderObject) {
        targetObject.markNeedsLayout();
      }
    }
  }

  @override
  //If this widget is not placed as a direct child of CustomColumn
  //then we will see an assertion of using this widget as child of a wrong widget.
  Type get debugTypicalAncestorWidgetClass => CustomColumn;
}
