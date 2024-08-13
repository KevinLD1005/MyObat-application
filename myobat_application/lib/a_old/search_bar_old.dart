// Padding(
//         // search bar
//         padding: const EdgeInsets.only(top: 16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               PreferredSize(
//                 preferredSize: const Size.fromHeight(48.0),
//                 child: Row(
//                   children: <Widget>[
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.only(
//                             left: 24.0, right: 24.0, bottom: 8.0),
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(24.0),
//                           border: Border.all(color: Colors.grey),
//                         ),
//                         child: TextFormField(
//                           onChanged: (String searchText) {},
//                           controller: _searchController,
//                           decoration: InputDecoration(
//                             hintText: 'Search...',
//                             contentPadding: const EdgeInsets.only(
//                                 left: 24.0,
//                                 top: 12), // Added right padding for icon
//                             border: InputBorder.none,
//                             suffixIcon: IconButton(
//                               icon:
//                                   const Icon(Icons.search, color: Colors.grey),
//                               onPressed: () {},
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(top: 275.0),
//                 child: Text(
//                   "LOGGED IN",
//                   style: TextStyle(fontSize: 24),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),