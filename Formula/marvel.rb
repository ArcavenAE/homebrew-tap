class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260920.113925.ccc07c6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-113925-ccc07c6/marvel-darwin-arm64"
    sha256 "b511f5d679a96b08c21871399b7aaf65c69a8b796d874fe0e56443eb0d38959a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-113925-ccc07c6/marvel-darwin-amd64"
    sha256 "c6e4eef4ce3e951a8c3fdee3469dd023d3bf962ab5fbd6ed44a70f35fc24466f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-113925-ccc07c6/marvel-linux-arm64"
    sha256 "d29758f8b7fb74a54642b40ff2fad9b122e11cf6cb54be4b3dd990c8e3d2d468"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260920-113925-ccc07c6/marvel-linux-amd64"
    sha256 "ceb1de67b8f6978feb8346e1c096f47a544fb1dca0fd03cae2d7cbdb90d553d1"
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
