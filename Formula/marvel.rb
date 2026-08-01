class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.030219.ebdc23c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-030219-ebdc23c/marvel-darwin-arm64"
    sha256 "a02abdeb4348519e19a8f4ab0eb804130ff7d2cc36dcd9e998bb1ae4da0d6575"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-030219-ebdc23c/marvel-darwin-amd64"
    sha256 "e9e7650fbf68a58a6101da28fefc55c6905fa3ca92d726d591075116fea8464f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-030219-ebdc23c/marvel-linux-arm64"
    sha256 "dcd69d048909a795d3bce209a9421b3125c47516d636e1e447df1025210fa40b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-030219-ebdc23c/marvel-linux-amd64"
    sha256 "8e9eba137b9e497931b0c6be151220db7c0567dab0661a32099991900ea88d2a"
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
