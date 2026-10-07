class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261007.051921.c76621d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-051921-c76621d/marvel-darwin-arm64"
    sha256 "a546c18236f88ed5bcc8a89177f5e990b5833feec6aee95a5328e061d3c645a5"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-051921-c76621d/marvel-darwin-amd64"
    sha256 "0152cbf95fc919fcbe7f53cc69a3cff7edc7c5f63ccd262bb890f9bd815b2ca6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-051921-c76621d/marvel-linux-arm64"
    sha256 "205028ee5a001b70e9b50e1427d73aa571aa8f51e03d2b82766e76a2ce8a15b3"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261007-051921-c76621d/marvel-linux-amd64"
    sha256 "6de856e8385d6e95dbe733b09f731d69e214cabab7c9d50fbbb89197df7286de"
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
