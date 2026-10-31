class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.015637.02aabef"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-015637-02aabef/marvel-darwin-arm64"
    sha256 "e1e0da39dacb58fb964fe5faf5a7fb824b2f9f95ae8513b49a1b3f9d519dcd72"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-015637-02aabef/marvel-darwin-amd64"
    sha256 "7147dddc5b317e9ade8b2362d93fad50ff42dc03e1ce41bca272ee266fd0c54d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-015637-02aabef/marvel-linux-arm64"
    sha256 "263a5985138bcda50b6d22824225207cba5edaea0c20d851e8893a2fd1706b48"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-015637-02aabef/marvel-linux-amd64"
    sha256 "b9cd20277dc5c87b50fde4c8b0f7a1407098f8fe50e3c10eb78e48a1d67f6d93"
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
