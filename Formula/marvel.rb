class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.042607.85b9d39"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-042607-85b9d39/marvel-darwin-arm64"
    sha256 "1c2d668c576cf69c03f33acac22f8f946aed8ef7146a0dd16722f94a02889358"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-042607-85b9d39/marvel-darwin-amd64"
    sha256 "f114f46ae3cae92236fac04eb6ae3fd85e0fe3027ea96db014f5633e393b8094"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-042607-85b9d39/marvel-linux-arm64"
    sha256 "9746da8e2929e553c126ba9ea430b3d5fa3a02936caf8013d81b5e9019ea4a76"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-042607-85b9d39/marvel-linux-amd64"
    sha256 "2e26c526152c75c18c99ecfe9e957bcef54a7222e6944ee2b5eb8f7875bd3766"
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
