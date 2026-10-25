class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261025.174801.12e5791"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174801-12e5791/marvel-darwin-arm64"
    sha256 "89634a55b964b448209cb01d0d453c2649103f4689270e7d81f42fd75d7d6424"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174801-12e5791/marvel-darwin-amd64"
    sha256 "ae724c5d3d1f08564905a1324abd6ff51d75a81e4fca54a47a7d62ef3f44d49f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174801-12e5791/marvel-linux-arm64"
    sha256 "f9d3511eb863fe7ad1de8d2a370e097e072324038863c2ff07aa9fc7be3f2112"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261025-174801-12e5791/marvel-linux-amd64"
    sha256 "b45eefe05513dfe9f74611cb282a6b06b2347eee62a7ea6c7b27648a51021ce9"
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
