import 'package:dalel/feature/home/presentation/widgets/Home_Sections/historical_Characters_section.dart';
import 'package:dalel/feature/home/presentation/widgets/Home_Sections/historical_periode_section.dart';
import 'package:dalel/feature/home/presentation/widgets/Home_Sections/historical_souvenirs_section.dart';
import 'package:dalel/feature/home/presentation/widgets/Home_Sections/home_app_bar_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HomeAppBarSection()),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharactersSection()),
            SliverToBoxAdapter(child: HistoricalSouvenirsSection())
          ],
        ),
      ),
    );
  }
}
