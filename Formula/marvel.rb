class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.183342.4367f1c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-183342-4367f1c/marvel-darwin-arm64"
    sha256 "6555096ae83893d5e330191c1d57c35527432ec518e25bdbc086241d8f121cdd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-183342-4367f1c/marvel-darwin-amd64"
    sha256 "4cabb3b30eeb776e9a0c0efa499d84e30e1caeb3ff302e23a3f5c4173882a773"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-183342-4367f1c/marvel-linux-arm64"
    sha256 "e323b69ae08779459ee0c6aae85ca2438a6f923e845ad2073eb1d66f1921e654"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-183342-4367f1c/marvel-linux-amd64"
    sha256 "6fdb206b6bce6ecf1b17deb0c4daf7a39c92fd7ed6ef22a540df15c5a880c651"
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
