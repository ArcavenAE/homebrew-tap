class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260926.213459.a2e3121"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-213459-a2e3121/marvel-darwin-arm64"
    sha256 "6f746990277d5a973a1531d3b1860c3ce433db42a3225242b5e99b9b838a9c0e"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-213459-a2e3121/marvel-darwin-amd64"
    sha256 "e23a927720a211d531483a5e0cd42521067ad627439411979298b8767c7f2d2d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-213459-a2e3121/marvel-linux-arm64"
    sha256 "4c84de5d7d498c24a605a17e4e2a1fda2dbee89c3b4c9b7d94cd7b311ae029f7"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260926-213459-a2e3121/marvel-linux-amd64"
    sha256 "25d8adfbcd1d41b431652d239731cddaa42fb9dbbfeddfe4ae8b08f42e5df893"
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
