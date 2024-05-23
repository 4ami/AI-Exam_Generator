import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/bloc/bloc_class/content_bloc.dart';
import 'package:frontend/bloc/event/content_events.dart';

class SelectedContents extends StatelessWidget {
  const SelectedContents({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.4),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.white54.withOpacity(.3),
              blurRadius: 15,
              blurStyle: BlurStyle.outer,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.black,
                      fontFamily: 'EXO-R',
                      fontWeight: FontWeight.w600,
                    ),
              ),
              IconButton(
                onPressed: () {
                  context.read<ContentBloc>().add(DropFile(key: name));
                },
                icon: const Icon(
                  Icons.close,
                  size: 20,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
