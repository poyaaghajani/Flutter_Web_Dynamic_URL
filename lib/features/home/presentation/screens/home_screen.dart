import 'package:aloplay_simulation/config/route/route_names.dart';
import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:aloplay_simulation/core/coantants/app_defaults.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_all/get_club_bloc.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.seoName});

  final String seoName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _lastSeoName;

  @override
  void initState() {
    super.initState();
    _lastSeoName = widget.seoName;
    _updateClubCategory();
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.seoName != _lastSeoName) {
      _lastSeoName = widget.seoName;
      _updateClubCategory();
    }
  }

  void _updateClubCategory() {
    final storageManager = locator<StorageManager>();
    storageManager.getClubCategoryBySeoName(widget.seoName).then((category) {
      if (category != null) {
        Future.wait([
          storageManager.saveClubCategoryId(category.id),
          storageManager.saveBusinessModelType(category.businessModelType),
        ]).then((_) {
          storageManager.clubCategoryIdNotifier.value = category.id;
          storageManager.clubBusinessModelTypeNotifier.value =
              category.businessModelType;
          context.read<GetPublicClubBloc>().add(
            GetAllPublicClubsRequest(page: 1),
          );
        });
      } else {
        context.read<GetPublicClubBloc>().add(
          GetAllPublicClubsRequest(page: 1),
        );
      }
    });
    getCats();
  }

  Future<void> getCats() async {
    final storageManager = locator<StorageManager>();

    var cats = await storageManager.getClubCategories();

    for (var cat in cats) {
      print('${cat.seoName}: ${cat.id}-${cat.businessModelType}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetPublicClubBloc, GetPublicClubState>(
        builder: (context, state) {
          if (state is GetPublicClubCompleted) {
            return state.allPublicClubs.fold(
              (error) {
                return Text(error);
              },
              (success) {
                return CustomScrollView(
                  slivers: [
                    SliverGrid.builder(
                      itemCount: success.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.goNamed(
                              RouteNames.clubDetail,
                              pathParameters: {
                                'lan': AppDef.defaultCachedLan(context),
                                'seoName': widget.seoName,
                                'id': success.data![index].id.toString(),
                              },
                            );
                          },
                          child: Container(
                            color: AppColors.blue800,
                            child: Center(
                              child: Text(
                                success.data![index].name ?? '---',
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
