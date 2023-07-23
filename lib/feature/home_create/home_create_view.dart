// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:nuntium/feature/home_create/home_logic.dart';

import 'package:nuntium/product/constants/index.dart';
import 'package:nuntium/product/enums/index.dart';
import 'package:nuntium/product/models/category.dart';

class HomeCreate extends StatefulWidget {
  const HomeCreate({super.key});

  @override
  State<HomeCreate> createState() => _HomeCreateState();
}

class _HomeCreateState extends State<HomeCreate> with Loading {
  late final HomeLogic _homeLogic;

  @override
  void initState() {
    super.initState();
    _homeLogic = HomeLogic();
    _fetchInitializeCategory();
  }

  Future<void> _fetchInitializeCategory() async {
    await _homeLogic.fetchAllCategory();

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _homeLogic.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstant.addNewItem),
        centerTitle: false,
        actions: [
          if (isloading)
            const Center(
              child: CircularProgressIndicator(
                color: ColorConstant.white,
              ),
            )
        ],
      ),
      body: Form(
        key: _homeLogic.formKey,
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {
          _homeLogic.checkValidateAndSave(
            (value) {
              setState(() {});
            },
          );
        },
        child: Padding(
          padding: context.padding.normal,
          child: ListView(
            children: [
              _HomeCategoryDropDown(
                categories: _homeLogic.categories,
                onSelected: (value) {
                  _homeLogic.updateCategory(value);
                },
              ),
              const _EmptySizeBox(),
              TextFormField(
                controller: _homeLogic.titleController,
                validator: (value) => value == null ? 'Not Empty' : null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: StringConstant.textfieldTitle,
                ),
              ),
              const _EmptySizeBox(),
              InkWell(
                onTap: () async {
                  await _homeLogic.pickAndCheck(
                    (value) {
                      setState(() {});
                    },
                  );
                },
                child: SizedBox(
                  height: context.sized.dynamicHeight(0.2),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstant.grayPrimary,
                      ),
                    ),
                    child: _homeLogic.selectedFileBytes != null
                        ? Image.memory(_homeLogic.selectedFileBytes!)
                        : const Icon(Icons.add_a_photo_outlined),
                  ),
                ),
              ),
              const _EmptySizeBox(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size.fromHeight(
                    WidgetSize.buttonNormal.value.toDouble(),
                  ),
                ),
                onPressed: !_homeLogic.isValidateAllForm
                    ? null
                    : () async {
                        changeLoading();
                        final response = await _homeLogic.create();
                        changeLoading();
                        if (!mounted) return;
                        await context.route.pop<bool>(response);
                      },
                icon: const Icon(Icons.send_outlined),
                label: const Text(StringConstant.buttonCreate),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptySizeBox extends StatelessWidget {
  const _EmptySizeBox();

  @override
  Widget build(BuildContext context) {
    return context.sized.emptySizedHeightBoxLow;
  }
}

class _HomeCategoryDropDown extends StatelessWidget {
  const _HomeCategoryDropDown({
    required this.categories,
    required this.onSelected,
  });
  final List<CategoryModel> categories;
  final ValueSetter<CategoryModel> onSelected;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CategoryModel>(
      validator: (value) => value == null ? 'Not Empty' : null,
      items: categories.map((e) {
        return DropdownMenuItem<CategoryModel>(
          value: e,
          child: Text(e.name ?? ''),
        );
      }).toList(),
      hint: const Text(StringConstant.dropdownHint),
      onChanged: (value) {
        if (value == null) return;
        onSelected.call(value);
      },
    );
  }
}

mixin Loading on State<HomeCreate> {
  bool isloading = false;
  void changeLoading() {
    setState(() {
      isloading != isloading;
    });
  }
}
