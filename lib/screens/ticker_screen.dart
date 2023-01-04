// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:deriv_interview_app/components/loading_indicator.dart';
import 'package:deriv_interview_app/cubits/market_cubit_select.dart';
import 'package:deriv_interview_app/cubits/markets_cubit.dart';
import 'package:deriv_interview_app/cubits/custom_symbols_cubit.dart';
import 'package:deriv_interview_app/cubits/price_cubit.dart';
import 'package:deriv_interview_app/cubits/selected_symbol_cubit.dart';
import 'package:deriv_interview_app/cubits/symbols_cubit.dart';
import 'package:deriv_interview_app/models/active_symbol.dart';
import 'package:deriv_interview_app/models/market_list.dart';
import 'package:deriv_interview_app/models/tick.dart';
import 'package:deriv_interview_app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickerScreen extends StatelessWidget {
  const TickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Price Tracker'),
        centerTitle: true,
      ),
      body: BlocBuilder<SymbolsCubit, List<ActiveSymbol>?>(
        builder: (context, s) {
          while (s == null || s.isEmpty) {
            return const Loading();
          }
          return Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Builder(
                builder: (context) {
                  return Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 10,
                      shape: Styles.cardShape,
                      child: BlocBuilder<MarketsCubit, Markets?>(
                        builder: (context, markets) {
                          while (markets == null) {
                            return const Loading();
                          }
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BlocBuilder<MarketCubitSelect, String?>(
                                builder: (context, selectedMarket) {
                              return DropdownButton<String>(
                                isExpanded: true,
                                underline: Container(
                                  height: 2,
                                  color: Colors.blue,
                                ),
                                alignment: Alignment.center,
                                icon: const Icon(
                                  Icons.arrow_drop_down_circle_rounded,
                                  color: Colors.blue,
                                ),
                                hint: const Text('Select Market . . .'),
                                items: markets.markets.map((e) {
                                  return DropdownMenuItem<String>(
                                    value: e,
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          e.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  context
                                      .read<MarketCubitSelect>()
                                      .selectMarket(value);
                                  context
                                      .read<CustomSymbolsCubit>()
                                      .makeCustomList();
                                  context
                                      .read<SelectedSymbolCubit>()
                                      .selectSymbol(null);
                                },
                                value: selectedMarket,
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                flex: 2,
                child: Card(
                  elevation: 10,
                  shape: Styles.cardShape,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlocBuilder<MarketCubitSelect, String?>(
                      builder: (context, selectedMarket) {
                        return BlocBuilder<CustomSymbolsCubit,
                            List<ActiveSymbol>?>(
                          builder: (context, s) {
                            while (s == null || s.isEmpty) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('Select Market First...'),
                                ],
                              );
                            }
                            _buildItems() {
                              return s.map((e) {
                                return DropdownMenuItem<ActiveSymbol>(
                                  value: e,
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${e.displayName} - ${e.symbol}\n${e.market}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList();
                            }

                            return BlocBuilder<SelectedSymbolCubit,
                                ActiveSymbol?>(
                              builder: (context, selectedSymbol) {
                                return BlocBuilder<PriceCubit, TickRes?>(
                                    builder: (context, price) {
                                  return DropdownButton<ActiveSymbol>(
                                    itemHeight: 60,
                                    isExpanded: true,
                                    underline: Container(
                                      height: 2,
                                      color: Colors.blue,
                                    ),
                                    alignment: Alignment.center,
                                    icon: const Icon(
                                      Icons.arrow_drop_down_circle_rounded,
                                      color: Colors.blue,
                                    ),
                                    hint: const Text('Select Symbol . . .'),
                                    items: _buildItems(),
                                    onChanged: (value) {
                                      context
                                          .read<SelectedSymbolCubit>()
                                          .selectSymbol(value);
                                      context.read<PriceCubit>().followPrice();
                                    },
                                    value: selectedSymbol,
                                  );
                                });
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Center(
                  child: BlocBuilder<PriceCubit, TickRes?>(
                    builder: (context, price) {
                      while (price == null) {
                        return const Loading();
                      }
                      return Text('${price.tick.bid} ' r'$');
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
