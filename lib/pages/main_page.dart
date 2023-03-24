import 'package:flutter/material.dart';
import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

class MainPage extends StatelessWidget {
  final MainBloc bloc = MainBloc();

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SuperhoroesColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            StreamBuilder<MainPageState>(
              stream: bloc.observeMainPageState(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return SizedBox();
                }
                return Center(child: Text(snapshot.data.toString(), style: TextStyle(color: Colors.white),));
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () => bloc.nextState(),
                child: Text(
                  "Next state".toUpperCase(),
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
