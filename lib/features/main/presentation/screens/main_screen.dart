import 'package:aloplay_simulation/features/main/presentation/widgets/persist_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  /// On Tab Change
  void _onTabChange() {
    if (_tabController.indexIsChanging) {
      widget.shell.route.branches.length - 1;
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    // Sync the initial tab with the current shell index
    _tabController.index = widget.shell.currentIndex;

    // Add listener to TabController for tab changes
    _tabController.addListener(_onTabChange);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update TabController index when the shell index changes
    if (_tabController.index != widget.shell.currentIndex) {
      _tabController.animateTo(widget.shell.currentIndex);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            /// Persist TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: PersistTabBar(
                shell: widget.shell,
                tabController: _tabController,
              ),
            ),
          ];
        },
        body: widget.shell,
      ),
    );
  }
}
