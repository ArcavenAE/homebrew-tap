class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260815.020909.c279caf"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-020909-c279caf/marvel-darwin-arm64"
    sha256 "65a4e134bb9577970ee6db4250010fa710fb489b68ab9e4e30bd26261f690dde"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-020909-c279caf/marvel-darwin-amd64"
    sha256 "423e7386ee7c2dc673c7e864b8a78eb126fea43e49234c3971a97a1c3d778371"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-020909-c279caf/marvel-linux-arm64"
    sha256 "a778436a766a8d87a5be6c11c32348d8224ea3d7d925add81565fa726865aebe"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260815-020909-c279caf/marvel-linux-amd64"
    sha256 "5674983d854063c14e9f2842f768e2c3804f8e58b4b71c122ed626a5e2cd9228"
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
