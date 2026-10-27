class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.230817.f0b3c4e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-230817-f0b3c4e/marvel-darwin-arm64"
    sha256 "b5f555e123c18c593b73ed544c443299021a49fddbbf033278a77061b0c7516c"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-230817-f0b3c4e/marvel-darwin-amd64"
    sha256 "58b86e097a9d8ed5e83fac36404382c3dffb123c1d904f0318ea8bd3070797bc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-230817-f0b3c4e/marvel-linux-arm64"
    sha256 "ce02787bee48ad69ba7f522f6ba08afdd658123473c806d8129ac080dfcc3d66"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-230817-f0b3c4e/marvel-linux-amd64"
    sha256 "fc6ee15e544d0e290766e7dff4280d1caceeccf88d2ca73f4e46aceb62da9bff"
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
