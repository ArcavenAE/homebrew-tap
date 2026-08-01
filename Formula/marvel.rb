class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260801.220352.0fe07f3"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-220352-0fe07f3/marvel-darwin-arm64"
    sha256 "b9ee1d655c0566491ccc8131b3a6ea3e0d00c51fde59f3c008905ce8be6b422a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-220352-0fe07f3/marvel-darwin-amd64"
    sha256 "2b3ed65216d059adaac249f349df1a4f5bbcb48ff5d29aa31a64c1e866c7739b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-220352-0fe07f3/marvel-linux-arm64"
    sha256 "e13f5db4d4986d8186aef3907ba8eb3bfe8a757869ed87d0363370d7acf0455b"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260801-220352-0fe07f3/marvel-linux-amd64"
    sha256 "531179ead3c6e4460722eda347b181642d176191df9baf2563ebecacdd0a8eae"
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
