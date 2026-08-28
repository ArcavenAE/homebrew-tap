class Sideshow < Formula
  desc "Content pack manager for AI CLI tools"
  homepage "https://github.com/arcavenae/sideshow"
  version "0.1.0-alpha.20260828.200858.a0ac0d6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260828-200858-a0ac0d6/sideshow-darwin-arm64"
    sha256 "7cbd3d6ad030c0314be8576a11eff87d138379c3bb5225ae6ade937f8e5c2772"
  elsif OS.mac?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260828-200858-a0ac0d6/sideshow-darwin-amd64"
    sha256 "b19502ee08b93e9650f5271e8d77a50f5a64ad8f0e8f9890f53c0562e459f352"
  elsif OS.linux?
    url "https://github.com/arcavenae/sideshow/releases/download/alpha-20260828-200858-a0ac0d6/sideshow-linux-amd64"
    sha256 "9ea1952a50a426d4502b523348d167f51592fa4a7f6467bdf5128a6634cae015"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "sideshow-darwin-arm64" => "sideshow"
    elsif OS.mac?
      bin.install "sideshow-darwin-amd64" => "sideshow"
    elsif OS.linux?
      bin.install "sideshow-linux-amd64" => "sideshow"
    end
  end

  test do
    assert_match "sideshow", shell_output("#{bin}/sideshow version 2>&1")
  end
end
