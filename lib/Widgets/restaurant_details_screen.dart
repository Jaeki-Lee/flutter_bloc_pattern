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
import 'package:restaurant_finder/Favorite/bloc/favorite_bloc.dart';
import 'package:restaurant_finder/Restaurant/models/restaurant.dart';
import 'package:restaurant_finder/Restaurant/view/widgets/image_container.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final Restaurant? restaurant;

  const RestaurantDetailScreen({Key? key, this.restaurant}) : super(key: key);

  // const RestaurantDetailScreen({ Key? key }) : super(key: key);

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(widget.restaurant!.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildBanner(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.restaurant!.cuisines,
                  style: textTheme.subtitle1,
                ),
                Text(
                  widget.restaurant!.address,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          _buildDetails(context),
          _buildFavoriteButton(context)
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return ImageContainer(
      height: 200,
      url: widget.restaurant!.imageUrl,
    );
  }

  Widget _buildDetails(BuildContext context) {
    final style = TextStyle(fontSize: 16);

    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Price: ${widget.restaurant!.priceDisplay}',
            style: style,
          ),
          SizedBox(width: 40),
          Text(
            'Rating: ${widget.restaurant!.rating.average}',
            style: style,
          ),
        ],
      ),
    );
  }

  // 1
  Widget _buildFavoriteButton(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        List<Restaurant> favorites = [];

        if (state is UpdatedRestaurant) {
          favorites = state.favoriteRestaurantList;
          isFavorite = favorites.contains(widget.restaurant);
        }

        return TextButton.icon(
          onPressed: () => context
              .read<FavoriteBloc>()
              .add(ToggleRestaurantEvent(widget.restaurant!)),
          icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
          label: Text(
            'Favorite',
            style: TextStyle(
                color: isFavorite ? Theme.of(context).accentColor : null),
          ),
        );
      },
    );
  }
}

// class RestaurantDetailsScreen extends StatelessWidget {
//   final Restaurant? restaurant;

//   const RestaurantDetailsScreen({Key? key, this.restaurant}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;

//     return Scaffold(
//       appBar: AppBar(title: Text(restaurant!.name)),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           _buildBanner(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   restaurant!.cuisines,
//                   style: textTheme.subtitle1,
//                 ),
//                 Text(
//                   restaurant!.address,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
//                 ),
//               ],
//             ),
//           ),
//           _buildDetails(context),
//           _buildFavoriteButton(context)
//         ],
//       ),
//     );
//   }

//   Widget _buildBanner() {
//     return ImageContainer(
//       height: 200,
//       url: restaurant!.imageUrl,
//     );
//   }

//   Widget _buildDetails(BuildContext context) {
//     final style = TextStyle(fontSize: 16);

//     return Padding(
//       padding: EdgeInsets.only(left: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Text(
//             'Price: ${restaurant!.priceDisplay}',
//             style: style,
//           ),
//           SizedBox(width: 40),
//           Text(
//             'Rating: ${restaurant!.rating.average}',
//             style: style,
//           ),
//         ],
//       ),
//     );
//   }

//   // 1
//   Widget _buildFavoriteButton(BuildContext context) {
//     return BlocBuilder<FavoriteBloc, FavoriteState>(
//       builder: (context, state) {
//         print("FavoriteBloc BlocBuilder is loaded state is");

//         bool isFavorite = false;
//         List<Restaurant> favorites = [];

//         if (state is UpdatedRestaurant) {
//           favorites = state.favoriteRestaurantList;
//           isFavorite = favorites.contains(restaurant);
//           print("UpdatedRestaurant state isFavorite value $isFavorite");
//         }

//         return TextButton.icon(
//           onPressed: () => context
//               .read<FavoriteBloc>()
//               .add(ToggleRestaurantEvent(restaurant!)),
//           icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
//           label: Text(
//             'Favorite',
//             style: TextStyle(
//                 color: isFavorite ? Theme.of(context).accentColor : null),
//           ),
//         );
//       },
//     );
//   }
// }
