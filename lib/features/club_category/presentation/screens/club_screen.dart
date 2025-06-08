import 'package:aloplay_simulation/config/route/route_names.dart';
import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:aloplay_simulation/core/coantants/app_defaults.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/features/club_category/data/models/club_category_model.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/club_category_manage_bloc.dart';
import 'package:aloplay_simulation/features/club_category/presentation/bloc/get_all_status.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClubCategoryScreen extends StatefulWidget {
  const ClubCategoryScreen({super.key});

  @override
  State<ClubCategoryScreen> createState() => _ClubCategoryScreenState();
}

class _ClubCategoryScreenState extends State<ClubCategoryScreen> {
  @override
  void initState() {
    context.read<ClubCategoryManageBloc>().add(
      ClubCategoryGetAllRequest(page: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final StorageManager storageManager = locator<StorageManager>();

    return Scaffold(
      body: BlocBuilder<ClubCategoryManageBloc, ClubCategoryManageState>(
        builder: (context, state) {
          if (state.getAllStatus is ClubCategoryGetAllSuccess) {
            final success =
                (state.getAllStatus as ClubCategoryGetAllSuccess)
                    .clubCategories;

            // Save categories to StorageManager
            final categories =
                success.data!
                    .map(
                      (cat) => ClubCategoryCacheModel(
                        id: cat.id ?? 1,
                        seoName: cat.seoName?.replaceAll('/', '') ?? 'tennis',
                        businessModelType: cat.businessModelType ?? 0,
                      ),
                    )
                    .toList();
            storageManager.saveClubCategories(categories);

            return CustomScrollView(
              slivers: [
                SliverGrid.builder(
                  itemCount: success.data!.length,
                  itemBuilder: (context, index) {
                    var clubCat = success.data![index];

                    return InkWell(
                      onTap: () async {
                        /// save club category Id
                        await storageManager.saveClubCategoryId(
                          clubCat.id ?? 1,
                        );
                        storageManager.clubCategoryIdNotifier.value =
                            clubCat.id ?? 1;

                        /// save club category type
                        await storageManager.saveBusinessModelType(
                          clubCat.businessModelType ?? 0,
                        );
                        storageManager.clubBusinessModelTypeNotifier.value =
                            clubCat.businessModelType ?? 0;

                        /// save club category name
                        storageManager.saveClubCategoryName(
                          clubCat.seoName?.replaceAll('/', '') ?? 'tennis',
                        );

                        if (context.mounted) {
                          context.goNamed(
                            RouteNames.home,
                            pathParameters: {
                              'seoName': clubCat.seoName!.replaceAll('/', ''),
                              'lan': AppDef.defaultCachedLan(context),
                            },
                          );
                        }
                      },
                      child: Container(
                        color: AppColors.primary,
                        child: Center(
                          child: Text(
                            clubCat.title ?? '---',
                            style: TextStyle(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                ),
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
