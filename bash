# Set the target architectures and toolchain path
target_architectures=("arm32" "arm64")
toolchain_path="/path/to/your/arm/toolchain"

# Iterate over target architectures
for target_arch in "${target_architectures[@]}"; do

  # Create a directory for the cross-compiled binaries
  output_dir="$toolchain_path/arm-$target_arch-linux-gnueabi"
  mkdir -p "$output_dir"

  # Configure Mosquitto with TLS support
  cd mosquitto
  ./configure --host=$target_arch-none-linux-gnu --enable-tls --prefix="$output_dir"

  # Make and install Mosquitto
  make
  make install

  # Clean up
  make clean

done
