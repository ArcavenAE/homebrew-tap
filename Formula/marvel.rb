class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.043359.00312e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043359-00312e6/marvel-darwin-arm64"
    sha256 "8af4fa6c25adf58a14ddce06484d436e05a107f1f0ef808c08dea97de2484103"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043359-00312e6/marvel-darwin-amd64"
    sha256 "58747fb2cf9f9e01e9708d3d1a2d7bcb12f6786a0eb952665ddd3f2556c968f7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043359-00312e6/marvel-linux-arm64"
    sha256 "6e90cc813a2527e3687d9c34fdf8653ef9058fa25d3d5df4c9da3f6189a6b664"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-043359-00312e6/marvel-linux-amd64"
    sha256 "61b86b2fb43dc107e5e0924dd9bda627c24993280379799eb04e27aab6337f87"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
