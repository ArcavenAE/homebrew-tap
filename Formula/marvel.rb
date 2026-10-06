class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.211916.ece58d5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211916-ece58d5/marvel-darwin-arm64"
    sha256 "c055c052a79eb49f5960b6047f7c27280ce3e411200c49f55ba5dc59b875ba13"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211916-ece58d5/marvel-darwin-amd64"
    sha256 "497cdfe19ceee338cd5121d07956106604a8476da4682fa993a5697709af1570"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211916-ece58d5/marvel-linux-arm64"
    sha256 "b1ec41aed0da75fe7a5fc10012d2cf88fe5b6fdc39f2b2190f2d096c71209f81"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-211916-ece58d5/marvel-linux-amd64"
    sha256 "4b6f3223d45fa076b2866dc29213078ec962e6ae1e147d3d8140aba243caf684"
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
