class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260417.204330.5e127d8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204330-5e127d8/marvel-darwin-arm64"
    sha256 "eb0ce51eb3cc29cee0bdf9ebb956e5e3ebc124f2c3cf4337dd7e255a1e597de6"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204330-5e127d8/marvel-darwin-amd64"
    sha256 "cdd11ec9f154c224e5b7000d957a6f723f44ca268f71726e4b3a714759802d2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204330-5e127d8/marvel-linux-arm64"
    sha256 "d4d26cfad6f7c85340b610fff8e73c59c38ade9ada051512d42d8937185aca29"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260417-204330-5e127d8/marvel-linux-amd64"
    sha256 "9500124bac3ee1119282ae40d848dc77d61faedfa14f26bdd41c33d4426351c2"
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
