import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infrastructure/datasources/video_datasource_impl.dart';
import 'package:tiktok/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoRepositoryImpl(
      videoPostDataSource: LocalVideoDataSourceImpl(),
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider(videsRepository: videoPostRepository)
            ..loadPageNext(),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
