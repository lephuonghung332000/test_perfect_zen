import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:meditation_theme/meditation_theme.dart';

class ListMeditationTheme extends StatelessWidget {
  const ListMeditationTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<MeditationThemeBloc, MeditationThemeState>(
        builder: (context, state) {
          if (state is MeditationThemeLoadedState) {
            final List<MeditationThemeDTO> listMeditationTheme =
                state.listMeditationThemeDTO;
            listMeditationTheme
                .sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
            return ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return MeditationTheme(
                  index: index,
                  meditationThemeDTO: listMeditationTheme[index],
                );
              },
              itemCount: listMeditationTheme.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
