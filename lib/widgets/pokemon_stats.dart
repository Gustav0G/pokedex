import 'package:flutter/material.dart';

class PokemonStats extends StatefulWidget {
  final String? statName;
  final int? statValue;
  final Color? statColor;
  const PokemonStats({Key? key, this.statName, this.statValue, this.statColor})
      : super(key: key);

  @override
  State<PokemonStats> createState() => _PokemonStatsState();
}

class _PokemonStatsState extends State<PokemonStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            SizedBox(width: 30, child: Text(widget.statName!.toUpperCase())),
            const SizedBox(
              width: 20,
            ),
            Stack(
              children: [
                Container(
                  height: 20,
                  width: 300,
                  decoration: BoxDecoration(
                      color: const Color(0xffE0E0E0),
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 20,
                  width: double.parse(widget.statValue.toString()),
                  decoration: BoxDecoration(
                      color: widget.statColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text(widget.statValue.toString())),
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
