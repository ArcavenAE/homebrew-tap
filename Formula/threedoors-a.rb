class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260309.4be0957"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4be0957/threedoors-a-darwin-arm64"
    sha256 "daa266a7fdf622db0198b24514bad57844ad84e8461a13a0340e9966b2032626"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4be0957/threedoors-a-darwin-amd64"
    sha256 "cd0bd9e7a656f13318670e3f072131422d3da63f85b9574b07abb874b7d28e49"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260309-4be0957/threedoors-a-linux-amd64"
    sha256 "1fafa2f1f69530f819106f75afc3956aef0dfd972a93dd9ed8577a3d4bc00c62"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "threedoors-a-darwin-arm64" => "threedoors-a"
    elsif OS.mac?
      bin.install "threedoors-a-darwin-amd64" => "threedoors-a"
    elsif OS.linux?
      bin.install "threedoors-a-linux-amd64" => "threedoors-a"
    end
  end

  test do
    assert_match "ThreeDoors", shell_output("#{bin}/threedoors-a --version 2>&1")
  end
end
