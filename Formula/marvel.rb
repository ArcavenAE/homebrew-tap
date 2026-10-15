class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261015.172016.b14bd85"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-172016-b14bd85/marvel-darwin-arm64"
    sha256 "a2a04974244cf3e1d482193df9415de616c2698b9798fccdf92161518d4a8d46"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-172016-b14bd85/marvel-darwin-amd64"
    sha256 "d3a9dc1060ee36aeb7b77e8b77e7df9adf11bf70b53ab604e0f03bd50489773a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-172016-b14bd85/marvel-linux-arm64"
    sha256 "3131a81c513226de36b84daadb2bef244e7323e91e7c9ba1909d609910960efc"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261015-172016-b14bd85/marvel-linux-amd64"
    sha256 "4a74eb276cf4a076f97dd83c6decb324ac71f1a20cb678384af4f3336bebaef0"
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
