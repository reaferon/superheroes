import 'package:flutter/material.dart';
import 'package:superheroes/blocs/main_bloc.dart';
import 'package:superheroes/resources/superheroes_colors.dart';

class MainPage extends StatefulWidget {

  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final MainBloc bloc = MainBloc();

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

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}
