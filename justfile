example:
    go run . --seed 0 --dim 5 --rows 3 --output data/vector_5dim_3row_seed0.fvecs

gen-128-75000:
    go run . --seed 0 --rows 75000 --dim 128 --output data/vector_128dim_75000row_seed0.fvecs

gen-128-150000:
    go run . --seed 0 --rows 150000 --dim 128 --output data/vector_128dim_150000row_seed0.fvecs

gen-128-300000:
    go run . --seed 0 --rows 300000 --dim 128 --output data/vector_128dim_300000row_seed0.fvecs

gen-256-75000:
    go run . --seed 0 --rows 75000 --dim 256 --output data/vector_256dim_75000row_seed0.fvecs

gen-256-150000:
    go run . --seed 0 --rows 150000 --dim 256 --output data/vector_256dim_150000row_seed0.fvecs

gen-256-300000:
    go run . --seed 0 --rows 300000 --dim 256 --output data/vector_256dim_300000row_seed0.fvecs

gen-768-all: gen-768-75000 gen-768-150000 gen-768-300000

gen-768-75000:
    go run . --seed 0 --rows 75000 --dim 768 --output data/vector_768dim_75000row_seed0.fvecs

gen-768-150000:
    go run . --seed 0 --rows 150000 --dim 768 --output data/vector_768dim_150000row_seed0.fvecs

gen-768-300000:
    go run . --seed 0 --rows 300000 --dim 768 --output data/vector_768dim_300000row_seed0.fvecs

gen-1536-75000:
    go run . --seed 0 --rows 75000 --dim 1536 --output data/vector_1536dim_75000row_seed0.fvecs

gen-1536-150000:
    go run . --seed 0 --rows 150000 --dim 1536 --output data/vector_1536dim_150000row_seed0.fvecs

gen-1536-300000:
    go run . --seed 0 --rows 300000 --dim 1536 --output data/vector_1536dim_300000row_seed0.fvecs

verify-data:
    sha256sum -c directory_snapshot.txt

create-checksum:
    fd . ./data | sort | xargs sha256sum > directory_snapshot.txt
