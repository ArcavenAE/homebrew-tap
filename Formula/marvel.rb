class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261116.061927.3a6e768"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-061927-3a6e768/marvel-darwin-arm64"
    sha256 "d790746461e2b89afff999c31dff4838143f423afb717bc860a4d40d3873f36d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-061927-3a6e768/marvel-darwin-amd64"
    sha256 "203d2de34e19af86e29c695300f8e329fb193b44739000be497a5f511ba13a6a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-061927-3a6e768/marvel-linux-arm64"
    sha256 "e6573d520f87f03fbb8b0927b3f19fbb0fe81c37907757e7ba08592dc796eaae"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261116-061927-3a6e768/marvel-linux-amd64"
    sha256 "b9d417fa415bb3627228f9e3a7c56c542de890309f080064f9654d2040b0df15"
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
