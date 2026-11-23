class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261123.173610.0674589"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-173610-0674589/marvel-darwin-arm64"
    sha256 "3ff6ae1d8cc4257fc2f30cb2ae5bfc32ad039e0c4af3cd9017b123fd1228f21a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-173610-0674589/marvel-darwin-amd64"
    sha256 "08ddcb2b61c21ff3ba25d2bd2326be4d38589b0628c71c594bc6778c0228770b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-173610-0674589/marvel-linux-arm64"
    sha256 "c91a2855abccd946c5985188b732c31006b421d94990586b3ec8ea66e4e57510"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261123-173610-0674589/marvel-linux-amd64"
    sha256 "a185b512f9128b5db352f3f473ffead03495e21a94c557923c41884193b5b389"
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
