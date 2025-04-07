package main

import (
	"encoding/binary"
	"flag"
	"fmt"
	"math/rand"
	"os"
)

func main() {
	// Flags
	seed := flag.Int64("seed", 42, "Seed for RNG")
	dim := flag.Int("dim", 128, "Dimension of vectors")
	rows := flag.Int("rows", 1000, "Number of vectors to generate")
	stdout := flag.Bool("stdout", false, "Print vectors to stdout")
	output := flag.String("output", "vectors.fvecs", "Output filename")

	flag.Parse()

	// RNG setup
	rng := rand.New(rand.NewSource(*seed))

	// Create or overwrite the output file
	file, err := os.Create(*output)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Failed to create file: %v\n", err)
		os.Exit(1)
	}
	defer file.Close()

	for i := range *rows {
		// Write dimension as int32
		if err := binary.Write(file, binary.LittleEndian, int32(*dim)); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to write dimension: %v\n", err)
			os.Exit(1)
		}

		// Generate and write the float32 values
		vec := make([]float32, *dim)
		for j := range *dim {
			vec[j] = rng.Float32()
		}

		if err := binary.Write(file, binary.LittleEndian, vec); err != nil {
			fmt.Fprintf(os.Stderr, "Failed to write vector: %v\n", err)
			os.Exit(1)
		}

		// Optionally print to stdout
		if *stdout {
			fmt.Printf("Vector %d: %v\n", i, vec)
		}
	}

	fmt.Printf("Generated %d vectors of dimension %d in %s\n", *rows, *dim, *output)
}
