class ThreedoorsA < Formula
  desc "TUI task manager — alpha channel (updated on every main push)"
  homepage "https://github.com/arcaven/ThreeDoors"
  version "0.1.0-alpha.20260311.7f71531"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7f71531/threedoors-a-darwin-arm64"
    sha256 "2c08790f03ece96a8dbdf14a821fa5d7282add93298c4264e210e21abcca49a2"
  elsif OS.mac?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7f71531/threedoors-a-darwin-amd64"
    sha256 "2ce791090796fdf59773b10e764dcbf9d4111f7f85539a8595b28d796246c4ba"
  elsif OS.linux?
    url "https://github.com/arcaven/ThreeDoors/releases/download/alpha-20260311-7f71531/threedoors-a-linux-amd64"
    sha256 "dcdb92f26176471e10929272ebfc345b4cfccc989eec8fd64b279ae29f64b1e3"
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
