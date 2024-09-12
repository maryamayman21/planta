import 'package:flutter/material.dart';
import 'package:planta/widgets/cover_wigets/build_section.dart';
import 'package:planta/widgets/cover_wigets/textfield_widgets.dart/cvv_textfield.dart';
import 'package:planta/widgets/cover_wigets/textfield_widgets.dart/date_textfield.dart';
import 'package:planta/widgets/cover_wigets/textfield_widgets.dart/editable_textfield.dart';
import 'package:planta/widgets/cover_wigets/textfield_widgets.dart/pin_textfield.dart';
import 'package:planta/widgets/cover_wigets/textfield_widgets.dart/cardName_textfield.dart';

class CoverView extends StatefulWidget {
  const CoverView({super.key});

  @override
  State<CoverView> createState() => _CoverViewState();
}

class _CoverViewState extends State<CoverView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _expiredDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool deliveryMethodEdit = false;
  bool personalInformationEdit = false;
  bool HinhEdit = false;
  FocusNode _pinFocusNode = FocusNode();
  FocusNode _cardNameFocusNode = FocusNode();
  FocusNode _expiryDateFocusNode = FocusNode();
  FocusNode _cvvFocusNode = FocusNode();
  bool _pinIsFocused = true;
  bool _cardNameIsFocused = true;
  bool _expiryDateIsFocused = true;
  bool _cvvIsFocused = true;
  @override
  void initState() {
    _nameController.text = 'Trần Minh Trí';
    _pinFocusNode.addListener(() =>
        _updateFocusState(_pinFocusNode, (focused) => _pinIsFocused = focused));
    _cardNameFocusNode.addListener(() => _updateFocusState(
        _cardNameFocusNode, (focused) => _cardNameIsFocused = focused));
    _expiryDateFocusNode.addListener(() => _updateFocusState(
        _expiryDateFocusNode, (focused) => _expiryDateIsFocused = focused));
    _cvvFocusNode.addListener(() =>
        _updateFocusState(_cvvFocusNode, (focused) => _cvvIsFocused = focused));
    super.initState();
  }

  void _updateFocusState(FocusNode node, void Function(bool) onUpdate) {
    setState(() {
      onUpdate(node.hasFocus);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNameController.dispose();
    _cvvController.dispose();
    _expiredDateController.dispose();
    _pinController.dispose();
    _nameController.dispose();
    _cardNameFocusNode.dispose();
    _cvvFocusNode.dispose();
    _pinFocusNode.dispose();
    _expiryDateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(children: [
                Text(
                  'Banking Information',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                )
              ]),
              const Divider(
                thickness: 1,
                color: Colors.black87,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      PinTextfield(
                        controller: _pinController,
                        focusNode: _pinFocusNode,
                        isFocused: _pinIsFocused,
                      ),
                      CardnameTextfield(
                        controller: _cardNameController,
                        hintText: 'Card Name',
                        focusNode: _cardNameFocusNode,
                        isFocused: _cardNameIsFocused,
                      ),
                      DateTextfield(
                        controller: _expiredDateController,
                        focusNode: _expiryDateFocusNode,
                        isFocused: _expiryDateIsFocused,
                      ),
                      CvvTextfield(
                        controller: _cvvController,
                        focusNode: _cvvFocusNode,
                        isFocused: _cvvIsFocused,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SectionWidget(
                        title: 'Personal Information',
                        editFlag: personalInformationEdit,
                        onEditPressed: () {
                          setState(() {
                            personalInformationEdit = true;
                          });
                        },
                        textFields: [
                          EditableTextfield(
                            isEnabled: personalInformationEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                          EditableTextfield(
                            isEnabled: personalInformationEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                          EditableTextfield(
                            isEnabled: personalInformationEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SectionWidget(
                        title: 'Delivery Method',
                        editFlag: deliveryMethodEdit,
                        onEditPressed: () {
                          setState(() {
                            deliveryMethodEdit = true;
                          });
                        },
                        textFields: [
                          EditableTextfield(
                            isEnabled: deliveryMethodEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                          EditableTextfield(
                            isEnabled: deliveryMethodEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.streetAddress,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      SectionWidget(
                        title: 'Delivery Method',
                        editFlag: deliveryMethodEdit,
                        onEditPressed: () {
                          setState(() {
                            HinhEdit = true;
                          });
                        },
                        textFields: [
                          EditableTextfield(
                            isEnabled: HinhEdit,
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                          ),
                        ],
                      ),
                      const Row(children: [
                        Text(
                          'Hình thức thanh toán',
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500),
                        )
                      ]),
                      const Divider(
                        thickness: 1,
                        color: Colors.black87,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/black_panse.png',
                            height: 150,
                            width: 150,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Spider Plant',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 15,
                                    child: VerticalDivider(
                                      thickness: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'Ưa bóng',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              Text(
                                '250.000đ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                '2 items',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
