import 'package:flutter/material.dart';

// ==============================================================================
// FILTER RESULT
// ==============================================================================

class FilterResult {
  final RangeValues priceRange;
  final Set<String> categories;
  final Set<String> weights;

  const FilterResult({
    required this.priceRange,
    required this.categories,
    required this.weights,
  });
}

// ==============================================================================
// FILTER DRAWER
// ==============================================================================

class FilterDrawer extends StatefulWidget {
  final RangeValues initialPriceRange;
  final Set<String> initialCategories;
  final Set<String> initialWeights;

  const FilterDrawer({
    super.key,
    required this.initialPriceRange,
    required this.initialCategories,
    required this.initialWeights,
  });

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  late RangeValues priceRange;
  late Set<String> selectedCategories;
  late Set<String> selectedWeights;

  final List<String> categories = [
    'All',
    'Minikit',
    'Banskathi',
    'Ratna',
    'Gobindo Bhog',
    'Basmati',
    'JEERA KATHI',
  ];

  final List<String> weights = [
    '1 Kg',
    '2 Kg',
    '5 Kg',
    '10 Kg',
    '26 Kg',
    '30 Kg',
    '40 Kg',
  ];

  @override
  void initState() {
    super.initState();
    priceRange = widget.initialPriceRange;
    selectedCategories = Set<String>.from(widget.initialCategories);
    selectedWeights = Set<String>.from(widget.initialWeights);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.white,
      child: SizedBox(
        width: screenWidth * 0.82,
        child: SafeArea(
          child: Column(
            children: [
              // HEADER
              SizedBox(
                height: 58,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Filters',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),
              ),

              const Divider(height: 1),

              // CONTENT
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Categories'),
                      const SizedBox(height: 8),

                      ...categories.map((category) {
                        final isAll = category == 'All';

                        final selected = isAll
                            ? selectedCategories.isEmpty
                            : selectedCategories.contains(category);

                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(category),
                          value: selected,
                          activeColor: const Color(0xFFE23F1C),
                          onChanged: (value) {
                            setState(() {
                              if (isAll) {
                                selectedCategories.clear();
                              } else {
                                if (selected) {
                                  selectedCategories.remove(category);
                                } else {
                                  selectedCategories.add(category);
                                }
                              }
                            });
                          },
                        );
                      }),

                      const SizedBox(height: 12),

                      _sectionTitle('Price Range'),

                      RangeSlider(
                        values: priceRange,
                        min: 119,
                        max: 1649,
                        divisions: 153,
                        activeColor: const Color(0xFFE23F1C),
                        labels: RangeLabels(
                          '₹${priceRange.start.toInt()}',
                          '₹${priceRange.end.toInt()}',
                        ),
                        onChanged: (value) {
                          setState(() {
                            priceRange = value;
                          });
                        },
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('₹${priceRange.start.toInt()}'),
                          Text('₹${priceRange.end.toInt()}'),
                        ],
                      ),

                      const SizedBox(height: 18),

                      _sectionTitle('Weight'),
                      const SizedBox(height: 8),

                      ...weights.map((weight) {
                        final selected = selectedWeights.contains(weight);

                        return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          title: Text(weight),
                          value: selected,
                          activeColor: const Color(0xFFE23F1C),
                          onChanged: (value) {
                            setState(() {
                              if (selected) {
                                selectedWeights.remove(weight);
                              } else {
                                selectedWeights.add(weight);
                              }
                            });
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),

              // BOTTOM BUTTONS
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 8,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            priceRange = const RangeValues(119, 1649);
                            selectedCategories.clear();
                            selectedWeights.clear();
                          });
                        },
                        child: const Text('CLEAR'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            FilterResult(
                              priceRange: priceRange,
                              categories: Set<String>.from(selectedCategories),
                              weights: Set<String>.from(selectedWeights),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE23F1C),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('APPLY FILTER'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xffeeeeee)),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}