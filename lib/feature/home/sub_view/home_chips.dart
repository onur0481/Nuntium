part of '../home_view.dart';

class _ActiveChip extends StatelessWidget {
  const _ActiveChip(this.tagItem);
  final Tag tagItem;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tagItem.name ?? '',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstant.white,
        ),
      ),
      backgroundColor: ColorConstant.purplePrimary,
      padding: context.padding.low,
    );
  }
}

class _PassiveChip extends StatelessWidget {
  const _PassiveChip(this.tagItem);

  final Tag tagItem;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        tagItem.name ?? '',
        style: context.general.textTheme.bodySmall?.copyWith(
          color: ColorConstant.grayPrimary,
        ),
      ),
      backgroundColor: ColorConstant.grayLighter,
      padding: context.padding.low,
    );
  }
}
