import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:language_test/performance/custom_column.dart';

class CustomBox extends LeafRenderObjectWidget {
  const CustomBox({Key? key, this.flex = 0, required this.color})
      : super(key: key);

  final int flex;
  final Color color;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomBox(flex: flex, color: color);
  }
}

//We don't use any mixins here because  we don't have any child.
//But the CustomColumnRender used the mixins to manipulate their children.
class RenderCustomBox extends RenderBox {
  RenderCustomBox({
    required int flex,
    required Color color,
  })  : _flex = flex,
        _color = color;

  int _flex;
  int get flex => _flex;

  Color _color;
  Color get color => _color;

  @override
  CustomColumnParentData? get parentData {
    if (super.parentData == null) return null;

    assert(
      super.parentData is CustomColumnParentData,
      '$CustomBox can only be a direct child of a $CustomColumn',
    );

    return super.parentData as CustomColumnParentData;
  }

  @override
  void attach(PipelineOwner owner) {
    super.attach(owner);

    parentData!.flex = flex;
  }

  bool get sizedByParent => true;

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    return constraints.biggest;
  }
}
