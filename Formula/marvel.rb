class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.055112.2ae66d7"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-055112-2ae66d7/marvel-darwin-arm64"
    sha256 "b913cf9aa2eaa834ea5ea6aa1241c6233c54cd9cc9d2596d94f9577f44bb797d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-055112-2ae66d7/marvel-darwin-amd64"
    sha256 "5dee70bbfab29b4af895f50e57155b096e35aa6a6df7d3ec4684302e6871b7bd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-055112-2ae66d7/marvel-linux-arm64"
    sha256 "73277cb5675bcb45b140d1e0ee27308c1e93c77ca9328878ebb72c192a5f4c67"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-055112-2ae66d7/marvel-linux-amd64"
    sha256 "c4c17dc70d6d60ecb86a88837f843eb1b2ff3937ed1d5c6e315950cc4556f1b4"
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
