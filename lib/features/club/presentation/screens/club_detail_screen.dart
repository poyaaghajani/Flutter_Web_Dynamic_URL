import 'package:aloplay_simulation/core/coantants/app_colors.dart';
import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/features/club/presentation/bloc/get_single/get_single_club_bloc.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClubDetailScreen extends StatefulWidget {
  const ClubDetailScreen({super.key, required this.seoName, required this.id});
  final String seoName;
  final String id;

  @override
  State<ClubDetailScreen> createState() => _ClubDetailScreenState();
}

class _ClubDetailScreenState extends State<ClubDetailScreen> {
  String? _lastSeoName;

  @override
  void initState() {
    super.initState();
    _lastSeoName = widget.seoName;
    _updateClubCategory();
  }

  @override
  void didUpdateWidget(ClubDetailScreen oldWidget) {
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
          context.read<GetSinglePublicClubBloc>().add(
            GetSinglePublicClubRequest(id: int.parse(widget.id)),
          );
        });
      } else {
        context.read<GetSinglePublicClubBloc>().add(
          GetSinglePublicClubRequest(id: int.parse(widget.id)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetSinglePublicClubBloc, GetSinglePublicClubState>(
        builder: (context, state) {
          if (state is GetSinglePublicClubCompleted) {
            return state.club.fold(
              (error) {
                return Text(error);
              },
              (success) {
                return Center(
                  child: Text(
                    success.name ?? '---',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
