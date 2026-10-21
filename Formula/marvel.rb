class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261021.184343.a735938"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184343-a735938/marvel-darwin-arm64"
    sha256 "354fb697283a70321357fa5c75677c11760a0ba11d1df3e7e5a507a28bf7ed35"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184343-a735938/marvel-darwin-amd64"
    sha256 "46b22012ea8cd338a5159d25060ac46a36912c1f26c422aa9a6304b808bc752c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184343-a735938/marvel-linux-arm64"
    sha256 "e6aa956b9f288c1fdd4cd8c086cc4f9a85f7c8c56d625bc1a1216fd7ed2a17d7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261021-184343-a735938/marvel-linux-amd64"
    sha256 "6cd1418019cbffaae5a2f1be90955a5ce4de7f41da615f26244b272e25017e9c"
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
