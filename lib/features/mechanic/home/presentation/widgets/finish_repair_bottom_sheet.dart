import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vee/core/extensions/sizedbox_extensions.dart';
import 'package:vee/features/mechanic/home/data/models/finish_repair_model.dart';

import '../../../../../core/utils/app_padding.dart';
import '../../data/models/part_model.dart';
import '../cubit/mechanic_home_cubit.dart';
import '../cubit/mechanic_home_state.dart';

class FinishRepairBottomSheet extends StatefulWidget {
  final String maintenanceRequestId;

  const FinishRepairBottomSheet({
    super.key,
    required this.maintenanceRequestId,
  });

  @override
  // ignore: library_private_types_in_public_api
  _FinishRepairBottomSheetState createState() =>
      _FinishRepairBottomSheetState();
}

class _FinishRepairBottomSheetState extends State<FinishRepairBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _notesController = TextEditingController();
  final _expectedFinishDateController = TextEditingController();

  List<PartModel> availableParts = [];
  List<PartModel> selectedParts = [];
  PartModel? selectedPart;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MechanicHomeCubit>().getParts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: BlocConsumer<MechanicHomeCubit, MechanicHomeState>(
        listener: (context, state) => _handleStateChanges(context, state),
        builder: (context, state) {
          return Padding(
            padding: AppPadding.medium,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TopDragHandle(),
                verticalSpace(16),
                const SheetTitle(title: 'Finish Repair'),
                verticalSpace(20),
                Expanded(
                  child: _buildFormContent(state),
                ),
                _BottomButtons(
                  state: state,
                  onCancel: () => Navigator.pop(context),
                  onSubmit: _submitForm,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFormContent(MechanicHomeState state) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NotesField(controller: _notesController),
            SizedBox(height: 16.h),
            PartsSection(
              state: state,
              availableParts: availableParts,
              selectedParts: selectedParts,
              selectedPart: selectedPart,
              onPartSelected: (part) {
                setState(() => selectedPart = part);
                _showQuantityDialog(part);
              },
              onEditPart: _editQuantity,
              onDeletePart: (index) {
                setState(() => selectedParts.removeAt(index));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleStateChanges(BuildContext context, MechanicHomeState state) {
    state.maybeWhen(
      getPartsLoaded: (data) => setState(() => availableParts = data),
      getPartsError: (message) =>
          _showErrorSnackbar(context, 'Get Parts Error: $message'),
      finishRepairSuccess: (message) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(message)));
        Navigator.pop(context);
      },
      finishRepairError: (message) =>
          _showErrorSnackbar(context, 'Finish Repair Error: $message'),
      orElse: () {},
    );
  }

  void _showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _showQuantityDialog(PartModel part) {
    final quantityController = TextEditingController(text: '1');

    showDialog(
      context: context,
      builder: (context) => AddPartDialog(
        part: part,
        quantityController: quantityController,
        onAdd: (quantity) {
          setState(() {
            selectedParts.add(PartModel(
              id: part.id,
              name: part.name,
              quantity: quantity,
              cost: part.cost,
            ));
            selectedPart = null;
          });
        },
      ),
    );
  }

  void _editQuantity(PartModel part, int index) {
    final quantityController =
        TextEditingController(text: part.quantity.toString());

    showDialog(
      context: context,
      builder: (context) => EditPartDialog(
        quantityController: quantityController,
        onSave: (quantity) {
          setState(() {
            selectedParts[index] = PartModel(
              id: part.id,
              name: part.name,
              quantity: quantity,
              cost: part.cost,
            );
          });
        },
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (selectedParts.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select at least one part.')),
        );
        return;
      }

      final finishRepairModel = FinishRepairModel(
        notes: _notesController.text,
        initialReportId: widget.maintenanceRequestId,
        changedParts: selectedParts,
      );

      context.read<MechanicHomeCubit>().finish(finishRepairModel);
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    _expectedFinishDateController.dispose();
    super.dispose();
  }
}

// ==================== Widget Components ====================
class TopDragHandle extends StatelessWidget {
  const TopDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 4,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}

class SheetTitle extends StatelessWidget {
  final String title;

  const SheetTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class NotesField extends StatelessWidget {
  final TextEditingController controller;

  const NotesField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Notes',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Please enter some notes...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          maxLines: 3,
          validator: (value) =>
              value == null || value.isEmpty ? 'Please enter some notes' : null,
        ),
      ],
    );
  }
}

class PartsSection extends StatelessWidget {
  final MechanicHomeState state;
  final List<PartModel> availableParts;
  final List<PartModel> selectedParts;
  final PartModel? selectedPart;
  final ValueChanged<PartModel> onPartSelected;
  final Function(PartModel, int) onEditPart;
  final ValueChanged<int> onDeletePart;

  const PartsSection({
    super.key,
    required this.state,
    required this.availableParts,
    required this.selectedParts,
    required this.selectedPart,
    required this.onPartSelected,
    required this.onEditPart,
    required this.onDeletePart,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Parts',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        _buildPartsSelector(),
        if (selectedParts.isNotEmpty) ...[
          SizedBox(height: 16.h),
          SelectedPartsList(
            selectedParts: selectedParts,
            onEdit: onEditPart,
            onDelete: onDeletePart,
          ),
        ],
      ],
    );
  }

  Widget _buildPartsSelector() {
    return state.maybeWhen(
      getPartsLoading: () => const Center(child: CircularProgressIndicator()),
      getPartsError: (message) => ErrorMessage(message: message),
      getPartsLoaded: (_) => PartsDropdown(
        availableParts: availableParts,
        selectedParts: selectedParts,
        selectedPart: selectedPart,
        onChanged: onPartSelected,
      ),
      orElse: () => PartsDropdown(
        availableParts: availableParts,
        selectedParts: selectedParts,
        selectedPart: selectedPart,
        onChanged: onPartSelected,
      ),
    );
  }
}

class PartsDropdown extends StatelessWidget {
  final List<PartModel> availableParts;
  final List<PartModel> selectedParts;
  final PartModel? selectedPart;
  final ValueChanged<PartModel> onChanged;

  const PartsDropdown({
    super.key,
    required this.availableParts,
    required this.selectedParts,
    required this.selectedPart,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<PartModel>(
        value: selectedPart,
        hint: const Text('Select a part'),
        isExpanded: true,
        underline: const SizedBox(),
        items: availableParts
            .where((part) =>
                !selectedParts.any((selected) => selected.id == part.id))
            .map((part) => DropdownMenuItem<PartModel>(
                  value: part,
                  child: Text('${part.name} - ${part.cost} Ponds'),
                ))
            .toList(),
        onChanged: (newValue) => newValue != null ? onChanged(newValue) : null,
      ),
    );
  }
}

class SelectedPartsList extends StatelessWidget {
  final List<PartModel> selectedParts;
  final Function(PartModel, int) onEdit;
  final ValueChanged<int> onDelete;

  const SelectedPartsList({
    super.key,
    required this.selectedParts,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Parts (${selectedParts.length})',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 150.h,
          child: ListView.builder(
            itemCount: selectedParts.length,
            itemBuilder: (context, index) => SelectedPartCard(
              part: selectedParts[index],
              index: index,
              onEdit: onEdit,
              onDelete: onDelete,
            ),
          ),
        ),
      ],
    );
  }
}

class SelectedPartCard extends StatelessWidget {
  final PartModel part;
  final int index;
  final Function(PartModel, int) onEdit;
  final ValueChanged<int> onDelete;

  const SelectedPartCard({
    super.key,
    required this.part,
    required this.index,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 8.h),
      child: ListTile(
        title: Text(part.name ?? ''),
        subtitle: Text('Quantity: ${part.quantity} - Cost: ${part.cost} Ponds'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 20),
              onPressed: () => onEdit(part, index),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red, size: 20),
              onPressed: () => onDelete(index),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  final MechanicHomeState state;
  final VoidCallback onCancel;
  final VoidCallback onSubmit;

  const _BottomButtons({
    required this.state,
    required this.onCancel,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: const Text('Cancel', style: TextStyle(color: Colors.red)),
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: ElevatedButton(
            onPressed: state.maybeWhen(
              finishRepairLoading: () => null,
              orElse: () => onSubmit,
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12.h),
            ),
            child: state.maybeWhen(
              finishRepairLoading: () => const LoadingIndicator(),
              orElse: () => const Text('Finish Repair'),
            ),
          ),
        ),
      ],
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 16.w,
          height: 16.h,
          child: const CircularProgressIndicator(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        SizedBox(width: 8.w),
        const Text('...Loading'),
      ],
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red[200]!),
      ),
      child: Text(
        'Something went wrong: $message',
        style: TextStyle(color: Colors.red[700]),
      ),
    );
  }
}

class AddPartDialog extends StatelessWidget {
  final PartModel part;
  final TextEditingController quantityController;
  final ValueChanged<int> onAdd;

  const AddPartDialog({
    super.key,
    required this.part,
    required this.quantityController,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Quantity'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('${part.name}'),
          SizedBox(height: 16.h),
          TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Quantity',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
        ),
        ElevatedButton(
          onPressed: () {
            final quantity = int.tryParse(quantityController.text) ?? 1;
            onAdd(quantity);
            Navigator.pop(context);
          },
          child: const Text('add'),
        ),
      ],
    );
  }
}

class EditPartDialog extends StatelessWidget {
  final TextEditingController quantityController;
  final ValueChanged<int> onSave;

  const EditPartDialog({
    super.key,
    required this.quantityController,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Quantity'),
      content: TextField(
        controller: quantityController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: 'Quantity',
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final quantity = int.tryParse(quantityController.text) ?? 1;
            onSave(quantity);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
