class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.193340.80c0287"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193340-80c0287/marvel-darwin-arm64"
    sha256 "9a0183cd173933ee6f431840b4d50e896a279ff2daa4173dd102cf6c270171d3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193340-80c0287/marvel-darwin-amd64"
    sha256 "588614c8378f404f9ac8994ebaede47a33657db865093460aea082d312363ccc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193340-80c0287/marvel-linux-arm64"
    sha256 "c62070985d16844470d550095c3b2c3e7d139276319d624685b0eb459d7a7dfa"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-193340-80c0287/marvel-linux-amd64"
    sha256 "211ea41e172aa0af34ff6397795bd3dbfdb491c88d72d54edbc6eb6860f5a88f"
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
