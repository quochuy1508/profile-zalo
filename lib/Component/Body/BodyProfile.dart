import 'package:flutter/material.dart';
import 'package:sample_flutter_redux_app/Component/Body/BodyData.dart';
import 'package:sample_flutter_redux_app/Component/Body/FormInputCreatePost.dart';
import 'package:timelines/timelines.dart';

class BodyProfile extends StatelessWidget {
  final data = [FormInputCreatePost(), BodyData()];

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Color(0xff9b9b9b),
        fontSize: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 10.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 1.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: data.length,
            contentsBuilder: (_, index) {
              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [data[index]],
                ),
              );
            },
            indicatorBuilder: (_, index) {
              return OutlinedDotIndicator(borderWidth: 1.5, size: 12);
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color: Color.fromARGB(255, 194, 194, 194),
            ),
          ),
        ),
      ),
    );
  }
}
