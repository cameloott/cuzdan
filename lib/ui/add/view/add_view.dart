import 'package:cuzdan/core/base/state/base_state.dart';
import 'package:cuzdan/core/base/view/base_view.dart';
import 'package:cuzdan/ui/add/viewmodel/add_view_model.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends BaseState<AddView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<AddViewModel>(
      viewModel: AddViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, AddViewModel value) => Scaffold(
        key: value.scaffoldState,
        backgroundColor: Color(0xff111016),
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextHeader(),
                  buildTextFormFieldName(value),
                  buildTextFormFieldPrice(value),
                  buildTextFormFieldDate(value),
                  buildTextFormFieldSelect(value),
                  buildElevatedButtonDone(value),
                ],
              ),
              Column(
                children: [
                  Expanded(
                    child: DraggableScrollableSheet(
                      maxChildSize: 0.35,
                      minChildSize: 0.1,
                      initialChildSize: 0.1,
                      builder: (BuildContext context, myScrollController) {
                        return SingleChildScrollView(
                          clipBehavior: Clip.none,
                          controller: myScrollController,
                          child: Container(
                            //constraints: BoxConstraints.expand(width: width, height: height),
                            decoration: BoxDecoration(
                              color: Color(0xff141516),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xff2B44FF),
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.vertical(top: Radius.circular(24.0)),
                            ),
                            //color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 21.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(12.0),
                                    height: dynamicHeight(3),
                                    width: dynamicWidth(26),
                                    color: Color.fromRGBO(255, 255, 255, 0.4),
                                  ),
                                  Text(
                                    'Kategori Seçimi',
                                    style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 21.0),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 40.0, right: 20.0),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(8.0))),
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(Icons.abc, color: Color(0xff2B44FF)),
                                        ),
                                        Text('abc')
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextHeader() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(32), top: dynamicHeight(75)),
          width: dynamicWidth(67.15),
          height: dynamicHeight(67.15),
          decoration: BoxDecoration(
            color: Color(0xff2B44FF),
            shape: BoxShape.circle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(44.79), top: dynamicHeight(80)),
          child: Text(
            'cüzdana ekle',
            style: TextStyle(fontSize: 36),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormFieldName(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(29.85)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: viewModel.nameController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Name",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget buildTextFormFieldPrice(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: viewModel.priceController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'TL',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffE16A28)),
              ),
            ],
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Price",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget buildTextFormFieldDate(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      child: TextFormField(
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
        controller: viewModel.dateController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
          focusColor: Colors.white,
          suffixIcon: Icon(
            Icons.date_range,
            color: Color(0xffE16A28),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: Colors.grey,
          hintText: "Date",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget buildTextFormFieldSelect(AddViewModel viewModel) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
          width: dynamicWidth(150),
          height: dynamicHeight(48),
          child: TextFormField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            controller: viewModel.nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
              focusColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              hintText: "",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(15)),
          width: dynamicWidth(150),
          height: dynamicHeight(48),
          child: TextFormField(
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
            controller: viewModel.nameController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: dynamicWidth(15), top: dynamicHeight(16)),
              focusColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff2B44FF), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              fillColor: Colors.grey,
              hintText: "",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildElevatedButtonDone(AddViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(left: dynamicWidth(30), top: dynamicHeight(148)),
      width: dynamicWidth(330),
      height: dynamicHeight(50),
      decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(43, 68, 255, 0.2)), borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: ElevatedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(
            width: 1.0,
            color: Color(0xff2B44FF),
          )),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          backgroundColor: MaterialStateProperty.all(
            Color.fromRGBO(43, 68, 255, 0.2),
          ),
          alignment: Alignment.center,
        ),
        child: Text(
          'onayla',
          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        onPressed: () {
          //TODO
        },
      ),
    );
  }
}
