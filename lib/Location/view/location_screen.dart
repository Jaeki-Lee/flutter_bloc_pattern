/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_finder/Location/bloc/locationBloc/location_bloc.dart';
import 'package:restaurant_finder/Location/bloc/locationQueryBloc/location_query_bloc.dart';
import 'package:restaurant_finder/Location/models/location.dart';
import 'package:restaurant_finder/injector.dart';

class LocationScreen extends StatelessWidget {
  final bool isFullScreenDialog;

  const LocationScreen({Key? key, this.isFullScreenDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Where do you want to eat?')),
      body: BlocProvider<LocationQueryBloc>(
        create: (_) => injector(),
        child: BlocBuilder<LocationQueryBloc, LocationQueryState>(
          builder: (context, state) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a location'),
                    onChanged: (query) => context
                        .read<LocationQueryBloc>()
                        .add(SubmitQueryEvent(query)),
                  ),
                ),
                Expanded(
                  child: _buildResults(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildResults() {
    return BlocBuilder<LocationQueryBloc, LocationQueryState>(
      builder: (context, state) {
        if (state is LocationQueryInitState) {
          return Center(
            child: Text('Please type Location'),
          );
        }

        if (state is LocationLoading) {
          return Center(
            child: Text('Is Loading Location'),
          );
        }

        if (state is LocationLoaded) {
          return state.locationList.isNotEmpty
              ? _buildSearchResults(state.locationList)
              : Center(child: Text('No Results'));
        }

        return Center(
          child: Text('Please type Location'),
        );
      },
    );
  }

  Widget _buildSearchResults(List<Location> results) {
    // 2
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            context.read<LocationBloc>().add(SelectLocation(location));

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
}
