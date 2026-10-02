class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261002.214815.4c3600d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214815-4c3600d/marvel-darwin-arm64"
    sha256 "a4132b04c1ebb1f65d3942a8924a96662159b644efa9281038e998e97f3158d2"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214815-4c3600d/marvel-darwin-amd64"
    sha256 "cbeab5b892f2a11f0b9c768ef923471be39a6b5b023fcf9f25a277268e2bafed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214815-4c3600d/marvel-linux-arm64"
    sha256 "862daefd46f1a263b36f39143a2d1ed0435d294e75d40b75845b1ee9fee4c140"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261002-214815-4c3600d/marvel-linux-amd64"
    sha256 "86f406e4ea2dcfeaec2a894fd7d8901ad5fb09cad17bdb012b35a40153f08276"
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
