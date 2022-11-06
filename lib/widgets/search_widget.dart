import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common/constants.dart';
import '../data/providers/search_Provider/serach_service.dart';

class SearchWidget extends StatefulWidget {
  TextEditingController searchTextController;
  SearchWidget(this.searchTextController,
      {Key? key})
      : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchServiceModel>(builder: (context, servicesServices, child) {
      return Container(
        color: const Color(0xffFFFFFF),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, top: 10.0, bottom: 25.0),
          child: Card(
            color: Constants.lightThemeColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: ListTile(
              horizontalTitleGap: 0.0,
              leading: GestureDetector(
                onTap: () {
                  // widget.showSearchedList();
                  servicesServices.showSearchedListFun(true);
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              title: TextField(
                controller: widget.searchTextController,
                decoration: Constants.textFieldDecoration,
                onChanged: (val) {
                  servicesServices.showSmallCardsFun(true);
                  if(widget.searchTextController.text.isNotEmpty){
                    servicesServices.showOrigenalListFun(false);
                  }else{
                    servicesServices.showOrigenalListFun(true);
                  }
                },
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                // onChanged: onSearchTextChanged,
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  widget.searchTextController.clear();
                  // widget.hideSmallCards();
                  // widget.hideSearchedList();
                  servicesServices.showSearchedListFun(false);
                  servicesServices.showSmallCardsFun(false);
                  // onSearchTextChanged('');
                },
              ),
            ),
          ),
        ),
      );
    });
  }
}
