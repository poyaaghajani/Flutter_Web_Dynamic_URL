import 'package:aloplay_simulation/config/route/route_names.dart';
import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:aloplay_simulation/core/coantants/app_defaults.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/get_all_status.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/public_coach_manage_bloc.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key, required this.seoName});

  final String seoName;

  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  String? _lastSeoName;

  @override
  void initState() {
    super.initState();
    _lastSeoName = widget.seoName;
    _updateClubCategory();
  }

  @override
  void didUpdateWidget(CoachScreen oldWidget) {
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
          // Trigger club fetch
          context.read<PublicCoachManageBloc>().add(
            PublicCoachGetAllRequest(page: 1),
          );
        });
      } else {
        // Fallback to default or handle error
        context.read<PublicCoachManageBloc>().add(
          PublicCoachGetAllRequest(page: 1),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PublicCoachManageBloc, PublicCoachManageState>(
        builder: (context, state) {
          if (state.getAllStatus is PublicCoachGetAllSuccess) {
            final success =
                (state.getAllStatus as PublicCoachGetAllSuccess).response;

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
                          RouteNames.coachDetail,
                          pathParameters: {
                            'lan': AppDef.defaultCachedLan(context),
                            'seoName': widget.seoName,
                            'id': success.data![index]?.id.toString() ?? '',
                          },
                        );
                      },
                      child: Container(
                        color: AppColors.blue800,
                        child: Center(
                          child: Text(
                            '${success.data![index]?.firstName} ${success.data![index]?.lastName}',
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
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
