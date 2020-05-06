import 'package:flutter/material.dart';
import 'package:local_events_app/models/event.dart';
import 'package:local_events_app/myconfigs/styleguide.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key key, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24))),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Image.asset(
                event.imagePath,
                height: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        event.title,
                        style: eventLocationTextStyle,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            event.location,
                            style: eventLocationTextStyle.copyWith(fontSize: 5),// added this
                          )
                        ],
                      )
                    ],
                  ),
                  flex: 3,
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    event.duration,
                    style: eventLocationTextStyle.copyWith(
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
