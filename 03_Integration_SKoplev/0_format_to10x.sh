# Convert files back into 10x directory structure.
for matrix in *_matrix.mtx.gz; do
    sample="${matrix%_matrix.mtx.gz}"

    mkdir -p "$sample"

    mv "${sample}_barcodes.tsv.gz" "$sample/barcodes.tsv.gz"
    mv "${sample}_features.tsv.gz" "$sample/features.tsv.gz"
    mv "${sample}_matrix.mtx.gz"   "$sample/matrix.mtx.gz"
done