part of sliverlist_seperated;

class CustomSliverList extends SliverMultiBoxAdaptorWidget {
  final int itemCount;
  const CustomSliverList({
    super.key,
    required super.delegate,
    required this.itemCount,
  });

  CustomSliverList.separated({
    Key? key,
    required IndexedWidgetBuilder itemBuilder,
    required IndexedWidgetBuilder separatorBuilder,
    required this.itemCount,
  }) : super(
          key: key,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final itemIndex = index ~/ 2;
              final isSeparator = index.isOdd;
              if (isSeparator) {
                // Return separator widget
                return separatorBuilder(context, itemIndex);
              } else {
                // Return item widget
                return itemBuilder(context, itemIndex);
              }
            },
            childCount: itemCount * 2 - 1,
          ),
        );

  @override
  SliverMultiBoxAdaptorElement createElement() =>
      SliverMultiBoxAdaptorElement(this, replaceMovedChildren: true);

  @override
  RenderSliverList createRenderObject(BuildContext context) {
    final SliverMultiBoxAdaptorElement element =
        context as SliverMultiBoxAdaptorElement;
    return RenderSliverList(childManager: element);
  }
}
