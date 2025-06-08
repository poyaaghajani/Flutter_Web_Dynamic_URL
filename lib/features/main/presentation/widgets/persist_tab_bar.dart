import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersistTabBar extends SliverPersistentHeaderDelegate {
  final StatefulNavigationShell shell;
  final TabController tabController;

  PersistTabBar({required this.shell, required this.tabController});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final textTheme = Theme.of(context).textTheme;
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return Container(
      color: Colors.white,
      height: kToolbarHeight,
      padding: EdgeInsets.symmetric(horizontal: 72),
      child: TabBar(
        indicatorPadding: const EdgeInsets.only(bottom: 8),
        labelPadding: EdgeInsets.only(
          left: isRTL ? 40 : 0,
          right: isRTL ? 0 : 40,
        ),
        onTap: (index) {
          final String fullPath = shell.shellRouteContext.routerState.fullPath!;

          if (index == shell.currentIndex && context.canPop()) {
            if (fullPath != '/:lan/:seoName/home' &&
                fullPath != '/:lan/:seoName/clubs' &&
                fullPath != '/:lan/:seoName/coaches') {
              context.pop();
            }
          } else {
            if (shell.currentIndex != index) {
              shell.goBranch(index);
            }
          }
        },
        padding: EdgeInsets.zero,
        controller: tabController,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        dividerHeight: 0,
        indicatorColor: AppColors.primary900,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: Colors.transparent,
        labelStyle: textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          color: AppColors.primary900,
        ),
        unselectedLabelStyle: textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 13,
          color: AppColors.grey,
        ),
        tabs: [
          Tab(child: Text('Home Page')),
          Tab(child: Text('Clubs')),
          Tab(child: Text("Coaches")),
        ],
      ),
    );
  }

  @override
  double get minExtent => kToolbarHeight;

  @override
  double get maxExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
