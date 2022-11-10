import 'package:flutter/material.dart';
import 'package:niflex/constants/app_styles.dart';
import 'package:niflex/constants/color_constants.dart';
import 'package:niflex/constants/dimensions_constants.dart';
import 'package:niflex/features/explore/widgets/item_sort.dart';
import 'package:niflex/widgets/custom_button.dart';

class FilterDialog extends StatefulWidget {
  final List filterResults;
  const FilterDialog({
    super.key,
    required this.filterResults,
  });

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  final List<Map<String, dynamic>> categories = [
    {'prop': 'Movie'},
    {'prop': 'TV Shows'},
    {'prop': 'K-Drama'},
    {'prop': "Anime"},
  ];

  @override
  void initState() {
    super.initState();
    if (widget.filterResults.isNotEmpty) {
      categoryValue = widget.filterResults[0];
      regionValue = widget.filterResults[1];
      periodValue = widget.filterResults[2];
      sortValue = widget.filterResults[3];
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  String categoryValue = '';
  String regionValue = '';
  String periodValue = '';
  String sortValue = '';

  final List<Map<String, dynamic>> regions = [
    {'prop': 'All Regions'},
    {'prop': 'US'},
    {'prop': 'South Korea'},
    {'prop': "China"},
  ];

  final List<Map<String, dynamic>> periods = [
    {'prop': 'All Periods'},
    {'prop': '2022'},
    {'prop': '2021'},
    {'prop': "2020"},
    {'prop': "2019"},
    {'prop': "2018"},
  ];

  final List<Map<String, dynamic>> sorts = [
    {'prop': 'Popularity'},
    {'prop': 'Latest Release'},
    {'prop': '2021'},
    {'prop': "2020"},
    {'prop': "2019"},
    {'prop': "2018"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kBottomBarIconSize,
      ),
      child: Column(
        children: [
          const SizedBox(height: kItemPadding),
          Text(
            'Sort & Filter',
            style: TextStyles.defaultStyle.semibold
                .setColor(ColorPalette.primaryColor)
                .setTextSize(20),
          ),
          const SizedBox(height: kMinPadding),
          const Divider(
            color: ColorPalette.unratedColor,
          ),
          const SizedBox(height: kMinPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Categories',
              style:
                  TextStyles.defaultStyle.bold.whiteTextColor.setTextSize(18),
            ),
          ),
          const SizedBox(height: kItemPadding),
          SizedBox(
            height: 43,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      categoryValue = categories[index]['prop'];
                    });
                  },
                  child: ItemSort(
                    prop: categories[index]['prop'],
                    groupValue: categoryValue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kItemPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Regions',
              style:
                  TextStyles.defaultStyle.bold.whiteTextColor.setTextSize(18),
            ),
          ),
          const SizedBox(height: kItemPadding),
          SizedBox(
            height: 43,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: regions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      regionValue = regions[index]['prop'];
                    });
                  },
                  child: ItemSort(
                    prop: regions[index]['prop'],
                    groupValue: regionValue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kItemPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Time/Periods',
              style:
                  TextStyles.defaultStyle.bold.whiteTextColor.setTextSize(18),
            ),
          ),
          const SizedBox(height: kItemPadding),
          SizedBox(
            height: 43,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: periods.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      periodValue = periods[index]['prop'];
                    });
                  },
                  child: ItemSort(
                    prop: periods[index]['prop'],
                    groupValue: periodValue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kItemPadding),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Sort',
              style:
                  TextStyles.defaultStyle.bold.whiteTextColor.setTextSize(18),
            ),
          ),
          const SizedBox(height: kItemPadding),
          SizedBox(
            height: 43,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sorts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      sortValue = sorts[index]['prop'];
                    });
                  },
                  child: ItemSort(
                    prop: sorts[index]['prop'],
                    groupValue: sortValue,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: kItemPadding),
          const Divider(
            color: ColorPalette.unratedColor,
          ),
          const SizedBox(height: kItemPadding),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    categoryValue = '';
                    regionValue = '';
                    periodValue = '';
                    sortValue = '';
                  });
                },
                child: const CustomButton(
                  color: Color(0xFF34373F),
                  icon: null,
                  padding: kDefaultPadding,
                  textButton: 'Reset',
                ),
              ),
              const SizedBox(width: kDefaultPadding),
              GestureDetector(
                onTap: () {
                  List filters = [];
                  filters.add(categoryValue);
                  filters.add(regionValue);
                  filters.add(sortValue);
                  filters.add(periodValue);

                  Navigator.pop(context, filters);
                },
                child: const CustomButton(
                  padding: kDefaultPadding,
                  color: ColorPalette.primaryColor,
                  icon: null,
                  textButton: 'Apply',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
