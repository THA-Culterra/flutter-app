import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Profile/domain/entities/uiState.dart';
import '../../../../Widgets/ct_card.dart';
import '../../../../Widgets/report_suggestion.dart';
import '../../../data/models/athletics.dart';
import '../../../domain/entities/CTCardData.dart';
import 'athletic_view_model.dart';

class AthleticScreen extends StatelessWidget {
  const AthleticScreen({super.key, required this.athletics});

  final Athletics athletics;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AthleticsViewModel(athletics: athletics),
      child: Consumer<AthleticsViewModel>(
        builder: (context, vm, _) {
          final state = vm.uiState;

          if (state is UiLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is UiError) {
            return Center(child: Text("Error: ${state.toString()}"));
          }

          final (sports, athletes) = (state as UiSuccess<(List<CTCardData>, List<CTCardData>)>).data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    rowBuilder("Top Sports", sports),
                    SizedBox(height: 16),
                    rowBuilder("Popular Athletes", athletes),
                  ],
                ),
              ),
              ReportSuggestion(),
            ],
          );
        },
      ),
    );
  }

  Widget rowBuilder(String title, List<CTCardData> list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.none,
            )),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            separatorBuilder: (_, __) => SizedBox(width: 16),
            itemBuilder: (_, index) => CTCard(data: list[index]),
          ),
        ),
      ],
    );
  }
}







