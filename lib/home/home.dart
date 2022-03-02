import 'package:api_bloc/services/coinApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<CoinService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Activities for bored people'),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.name),
                  Text(state.image),
                  Text(
                    state.atl.toString(),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                    child: Text('LOAD NEXT'),
                  )
                ],
              );
            }

            return Container();
          })),
    );
  }
}
