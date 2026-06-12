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
            width: 24,
            height: 24,
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
                ShimmerLine(width: 80, height: 12),
                SizedBox(height: 4),
                ShimmerLine(width: 160, height: 14),
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
          decoration: BoxDecoration(
            color: cs.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(20),
          ),
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

class ShimmerHeaderCard extends StatelessWidget {
  const ShimmerHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerLine(width: 50, height: 11),
                SizedBox(height: 4),
                ShimmerLine(width: 180, height: 14),
                SizedBox(height: 4),
                ShimmerLine(width: 140, height: 12),
                SizedBox(height: 4),
                ShimmerLine(width: 120, height: 12),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 80,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
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
    final cs = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(3.0),
          1: FlexColumnWidth(1.5),
          2: FlexColumnWidth(1.8),
          3: FlexColumnWidth(1.8),
        },
        children: [
          TableRow(
            decoration: BoxDecoration(color: cs.primary),
            children: List.generate(
              4,
              (_) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 11,
                ),
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          ...List.generate(rowCount, (i) {
            final isEven = i.isEven;
            return TableRow(
              decoration: BoxDecoration(
                color: isEven ? cs.surface : cs.surfaceContainerLowest,
                border: Border(
                  bottom: BorderSide(
                    color: cs.outlineVariant.withOpacity(0.5),
                    width: 0.5,
                  ),
                ),
              ),
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
                      decoration: BoxDecoration(
                        color: cs.primaryContainer,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Container(
                          height: 10,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
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
      ),
    );
  }
}

class ShimmerCartaResume extends StatelessWidget {
  final int rowCount;

  const ShimmerCartaResume({super.key, this.rowCount = 4});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cs.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          ...List.generate(rowCount, (_) => _buildRow()),
          const SizedBox(height: 4),
          Container(
            height: 1,
            width: double.infinity,
            color: cs.outlineVariant,
          ),
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

// ═════════════════════════════════════════════════════════
// PAGE-SPECIFIC SKELETONS
// ═════════════════════════════════════════════════════════

class SkeletonProductoDetalle extends StatelessWidget {
  const SkeletonProductoDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          children: [
            Center(
              child: Container(
                width: 128,
                height: 128,
                decoration: BoxDecoration(
                  color: cs.primaryContainer,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Center(child: ShimmerLine(width: 200, height: 28)),
            const SizedBox(height: 48),
            const ShimmerDetailsContainer(title: "Detalles", elementCount: 4),
          ],
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
    return Scaffold(
      appBar: AppBar(),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
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

// ── Compra ──

class SkeletonCompraDetalle extends StatelessWidget {
  const SkeletonCompraDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    final tt = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detalle de Compra",
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
              ShimmerHeaderCard(),
              SizedBox(height: 20),
              _SectionLabel(),
              SizedBox(height: 8),
              ShimmerTableResume(rowCount: 3),
              SizedBox(height: 20),
              _SectionLabel(),
              SizedBox(height: 8),
              ShimmerCartaResume(rowCount: 4),
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
              ShimmerHeaderCard(),
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

class SkeletonOrdenProduccionDetalle extends StatelessWidget {
  const SkeletonOrdenProduccionDetalle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: const [
              ShimmerHeaderCard(),
              SizedBox(height: 16),
              ShimmerDetailsContainer(
                title: "Información general",
                elementCount: 5,
              ),
              SizedBox(height: 16),
              ShimmerDetailsContainer(title: "Costos", elementCount: 4),
              SizedBox(height: 16),
              ShimmerDetailsContainer(
                title: "Consumo de insumos",
                customContent: _ShimmerTablaInsumos(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
