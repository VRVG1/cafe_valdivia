import 'package:cafe_valdivia/Debug/debug_panel.dart';
import 'package:cafe_valdivia/Pages/Options/options_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cafe_valdivia/Debug/debug_state.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ═════════════════════════════════════════════════════════
// BUILDING BLOCKS
// ═════════════════════════════════════════════════════════

class ShimmerLine extends StatelessWidget {
  final double? width;
  final double height;
  final double borderRadius;

  const ShimmerLine({
    super.key,
    this.width,
    this.height = 16,
    this.borderRadius = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}

class ShimmerDetailElement extends StatelessWidget {
  const ShimmerDetailElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerLine(width: 80, height: 16),
                SizedBox(height: 4),
                ShimmerLine(width: 160, height: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerDetailsContainer extends StatelessWidget {
  final String title;
  final int elementCount;
  final Widget? customContent;

  const ShimmerDetailsContainer({
    super.key,
    required this.title,
    this.elementCount = 3,
    this.customContent,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 12),
          child: ShimmerLine(width: 140, height: 24),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(16),
          child:
              customContent ??
              Column(
                children: List.generate(
                  elementCount,
                  (_) => const ShimmerDetailElement(),
                ),
              ),
        ),
      ],
    );
  }
}

class SkeletonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int chipsCount;
  const SkeletonAppBar({super.key, this.chipsCount = 1});

  @override
  Size get preferredSize => const Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // baseColor: cs.primaryContainer.withAlpha(80),
    // highlightColor: cs.onPrimary,
    return AppBar(
      backgroundColor: cs.surface,
      flexibleSpace: SafeArea(
        child: Shimmer.fromColors(
          baseColor: cs.primaryContainer.withAlpha(80),
          highlightColor: cs.onPrimary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 8),

              Container(
                width: 320,
                height: 48,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(color: cs.primary, width: 2),
                    ),

                    filled: true,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      chipsCount,
                      (index) => [
                        ShimmerLine(width: 40, height: 20),
                        const SizedBox(width: 10),
                      ],
                    ).expand((e) => e),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShimmerListTile extends StatelessWidget {
  const ShimmerListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    // baseColor: cs.primaryContainer.withAlpha(80),
    // highlightColor: cs.onPrimary,
    //
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(),
            title: ShimmerLine(width: 2, height: 16),
            subtitle: ShimmerLine(width: 2, height: 12),
            trailing: ShimmerLine(width: 20),
          ),
        ],
      ),
    );
  }
}

class ShimmerTableResume extends StatelessWidget {
  final int rowCount;

  const ShimmerTableResume({super.key, this.rowCount = 3});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(3.0),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.8),
        3: FlexColumnWidth(1.8),
      },
      children: [
        TableRow(
          children: List.generate(
            4,
            (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
              child: Container(
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
        ...List.generate(rowCount, (i) {
          return TableRow(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Container(
                  height: 14,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Container(
                    height: 24,
                    width: 50,
                    child: Center(
                      child: Container(
                        height: 10,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Container(
                  height: 14,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Container(
                  height: 14,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class ShimmerCartaResume extends StatelessWidget {
  final int rowCount;

  const ShimmerCartaResume({super.key, this.rowCount = 4});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ...List.generate(rowCount, (_) => _buildRow()),
          const SizedBox(height: 4),
          const SizedBox(height: 4),
          _buildRow(isTotal: true),
        ],
      ),
    );
  }

  Widget _buildRow({bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: isTotal ? 100 : 140,
            height: isTotal ? 16 : 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          Container(
            width: isTotal ? 80 : 60,
            height: isTotal ? 16 : 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerOrden extends StatelessWidget {
  const ShimmerOrden({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLine(width: 50),
                SizedBox(height: 8),
                ShimmerLine(width: 120),
                SizedBox(height: 8),
                ShimmerLine(width: 100),
                SizedBox(height: 8),
                ShimmerLine(width: 70),
                SizedBox(height: 8),
              ],
            ),
          ),
          Chip(
            label: const Text("No Pagado"),
            side: BorderSide.none,
            padding: const EdgeInsets.symmetric(horizontal: 4),
          ),
        ],
      ),
    );
  }
}
// ═════════════════════════════════════════════════════════
// PAGE-SPECIFIC SKELETONS
// ═════════════════════════════════════════════════════════

// ── Compra ──

class SkeletonDropMenu extends StatelessWidget {
  const SkeletonDropMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: cs.primaryContainer.withAlpha(80),
      highlightColor: cs.onPrimary,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(child: ShimmerLine(height: 32)),
        ],
      ),
    );
  }
}

class SkeletonCompraDetalle extends StatelessWidget {
  final String title;
  const SkeletonCompraDetalle({
    super.key,
    this.title = "Si ves esto, soy malo programando",
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),

      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _SectionLabel(),
              SizedBox(height: 10),
              ShimmerOrden(),
              _SectionLabel(),
              SizedBox(height: 10),
              ShimmerTableResume(rowCount: 3),
              SizedBox(height: 20),
              _SectionLabel(),
              SizedBox(height: 12),
              ShimmerCartaResume(rowCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonOrdenProduccionDetalle extends StatelessWidget {
  final String title;
  const SkeletonOrdenProduccionDetalle({
    super.key,
    this.title = "Si ves esto, soy malo programando",
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),

      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              _SectionLabel(),
              SizedBox(height: 10),
              ShimmerOrden(),
              ShimmerDetailsContainer(title: "Detalle", elementCount: 5),
              SizedBox(height: 10),
              ShimmerDetailsContainer(title: "Detalle", elementCount: 2),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonListTiles extends StatelessWidget {
  final int n;
  const SkeletonListTiles({super.key, this.n = 5});
  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;

    // baseColor: cs.primaryContainer.withAlpha(80),
    // highlightColor: cs.onPrimary,
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: n,
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: cs.primaryContainer.withAlpha(80),
          highlightColor: cs.onPrimary,
          child: ShimmerListTile(),
        );
      },
      separatorBuilder: (context, index) => const Divider(height: 1),
    );
  }
}

class SkeletonProductoDetalle extends StatelessWidget {
  final String detalleName;
  final int rowDetails;
  const SkeletonProductoDetalle({
    super.key,
    this.detalleName = "Detalles",
    this.rowDetails = 1,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          detalleName,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),

      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CircleAvatar(radius: 64)),
              SizedBox(height: 24),
              Center(child: ShimmerLine(width: 360, height: 30)),
              SizedBox(height: 60),
              ShimmerDetailsContainer(
                title: "Detalles",
                elementCount: rowDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonEditar extends StatelessWidget {
  final String editarName;
  final int rowEditField;

  const SkeletonEditar({
    super.key,
    this.editarName = "Editar",
    this.rowEditField = 4,
  });

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final TextTheme tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          editarName,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),

      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                rowEditField,
                (i) => [SkeletonDropMenu(), SizedBox(height: 24)],
              ).expand((e) => e),
            ],
          ),
        ),
      ),
    );
  }
}

class SkeletonClienteDetalle extends StatelessWidget {
  final String detalleName;
  final int rowDetails;
  const SkeletonClienteDetalle({
    super.key,
    this.detalleName = "Detalles",
    this.rowDetails = 1,
  });

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;
    final ColorScheme cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          detalleName,
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),

      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CircleAvatar(radius: 64)),
              SizedBox(height: 24),
              Center(child: ShimmerLine(width: 360, height: 30)),
              SizedBox(height: 60),
              ShimmerDetailsContainer(
                title: "Detalles",
                elementCount: rowDetails,
              ),
              SizedBox(height: 32),
              ShimmerDetailsContainer(title: "Ventas", elementCount: 0),
              Center(
                child: Container(
                  width: 500,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Center(
                child: Container(
                  width: 500,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel();

  @override
  Widget build(BuildContext context) {
    return const ShimmerLine(width: 120, height: 16);
  }
}

// ── Shared 3-column table helpers for receta / OP ──

class _HeaderRow3 extends StatelessWidget {
  final int col1Flex, col2Flex, col3Flex;

  const _HeaderRow3({this.col1Flex = 3, this.col2Flex = 1, this.col3Flex = 1});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: col1Flex, child: ShimmerLine(width: 60, height: 12)),
        Expanded(
          flex: col2Flex,
          child: Center(child: ShimmerLine(width: 40, height: 12)),
        ),
        Expanded(
          flex: col3Flex,
          child: Align(
            alignment: Alignment.centerRight,
            child: ShimmerLine(width: 50, height: 12),
          ),
        ),
      ],
    );
  }
}

class _DataRow3 extends StatelessWidget {
  final int col1Flex, col2Flex, col3Flex;

  const _DataRow3({this.col1Flex = 3, this.col2Flex = 1, this.col3Flex = 1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: col1Flex, child: ShimmerLine(width: 120, height: 14)),
          Expanded(
            flex: col2Flex,
            child: Center(child: ShimmerLine(width: 50, height: 14)),
          ),
          Expanded(
            flex: col3Flex,
            child: Align(
              alignment: Alignment.centerRight,
              child: ShimmerLine(width: 40, height: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShimmerTablaComponentes extends StatelessWidget {
  const _ShimmerTablaComponentes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderRow3(),
        const Divider(),
        ...List.generate(3, (_) => const _DataRow3()),
      ],
    );
  }
}

class _ShimmerTablaInsumos extends StatelessWidget {
  const _ShimmerTablaInsumos();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderRow3(col1Flex: 3, col2Flex: 2, col3Flex: 2),
        const Divider(),
        ...List.generate(
          3,
          (_) => const _DataRow3(col1Flex: 3, col2Flex: 2, col3Flex: 2),
        ),
      ],
    );
  }
}

// ── Receta ──

class SkeletonRecetaDetalle extends StatelessWidget {
  const SkeletonRecetaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final TextTheme tt = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalle de Receta",
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          if (ProviderScope.containerOf(
            context,
          ).read(debugStateProvider).enabled)
            IconButton(
              icon: const Icon(Icons.bug_report),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  useSafeArea: true,
                  builder: (_) => const DebugPanel(),
                );
              },
            ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OptionsList(),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
      body: Shimmer.fromColors(
        baseColor: cs.primaryContainer.withAlpha(80),
        highlightColor: cs.onPrimary,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ShimmerDetailsContainer(
                title: "Informacion general",
                elementCount: 3,
              ),
              SizedBox(height: 16),
              ShimmerDetailsContainer(
                title: "Componentes",
                customContent: _ShimmerTablaComponentes(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Venta ──

class SkeletonVentaDetalle extends StatelessWidget {
  const SkeletonVentaDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalle de Venta",
          style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 8),
              ShimmerListTile(),
              SizedBox(height: 20),
              _SectionLabel(),
              SizedBox(height: 8),
              ShimmerTableResume(rowCount: 3),
              SizedBox(height: 20),
              _SectionLabel(),
              SizedBox(height: 8),
              ShimmerCartaResume(rowCount: 3),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Orden de Producción ──

class SkeletonLine extends StatelessWidget {
  const SkeletonLine({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    return Shimmer.fromColors(
      baseColor: cs.primaryContainer.withAlpha(80),
      highlightColor: cs.onPrimary,
      child: ShimmerLine(),
    );
  }
}
