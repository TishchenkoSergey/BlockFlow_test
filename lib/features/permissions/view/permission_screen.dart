import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/permissions_cubit.dart';

class PermissionScreen extends StatelessWidget {
  const PermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionsCubit, PermissionsState>(
      builder: (context, state) {
        final isGranted = state.mediaPermissionStatus.isGranted;
        final isPermanentlyDenied = state.mediaPermissionStatus.isPermanentlyDenied;

        return Scaffold(
          appBar: AppBar(title: const Text('App Permissions'), centerTitle: true),
          body: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isGranted ? Icons.check_circle_outline : Icons.warning_amber_rounded,
                  color: isGranted ? Colors.green : Colors.orange,
                  size: 64,
                ),
                const SizedBox(height: 24),
                Text(
                  isGranted
                      ? 'Media access granted.\nYou are all set!'
                      : 'Media access required to use camera and microphone features.',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                if (isPermanentlyDenied)
                  Text(
                    'Permission was denied permanently.\nPlease enable it in system settings.',
                    style: TextStyle(color: Colors.red.shade700),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 32),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Request Permission'),
                  onPressed: () => context.read<PermissionsCubit>().requestPermissions(),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
