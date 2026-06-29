class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260629.173108.01a5ae1"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173108-01a5ae1/marvel-darwin-arm64"
    sha256 "072d98713c8c511f5afa0fe5dfc30ca008bcf2cb01e0c999069446d6202f7a17"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173108-01a5ae1/marvel-darwin-amd64"
    sha256 "bb2cf1ee83d4a62c4198a4900bbead65a465215c870495ef28ecedbd5919f9f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173108-01a5ae1/marvel-linux-arm64"
    sha256 "e4c12951caeee325f65fe4849d3daedbd87d9cb0e47bcd14121b66d8afde557d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260629-173108-01a5ae1/marvel-linux-amd64"
    sha256 "f02334f5e5190eadf2cbdcd3a2be38fdcf6ee18462d7fe330a9b87ff848ea2b4"
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
