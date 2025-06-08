import 'package:aloplay_simulation/core/storage/storage_manager.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/get_single_status.dart';
import 'package:aloplay_simulation/features/coach/presentation/bloc/public_coach_manage_bloc.dart';
import 'package:aloplay_simulation/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoachDetailScreen extends StatefulWidget {
  const CoachDetailScreen({super.key, required this.seoName, required this.id});
  final String seoName;
  final String id;

  @override
  State<CoachDetailScreen> createState() => _CoachDetailScreenState();
}

class _CoachDetailScreenState extends State<CoachDetailScreen> {
  String? _lastSeoName;

  @override
  void initState() {
    super.initState();
    _lastSeoName = widget.seoName;
    _updateClubCategory();
  }

  @override
  void didUpdateWidget(CoachDetailScreen oldWidget) {
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
            PublicCoachGetSingleRequest(id: int.parse(widget.id)),
          );
        });
      } else {
        // Fallback to default or handle error
        context.read<PublicCoachManageBloc>().add(
          PublicCoachGetSingleRequest(id: int.parse(widget.id)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PublicCoachManageBloc, PublicCoachManageState>(
        builder: (context, state) {
          if (state.getSingleStatus is PublicCoachGetSingleSuccess) {
            final success =
                (state.getSingleStatus as PublicCoachGetSingleSuccess).response;

            return Center(
              child: Text(
                success.firstName ?? '---',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
