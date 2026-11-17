class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261117.024949.c6c4b21"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-024949-c6c4b21/marvel-darwin-arm64"
    sha256 "cc1536f86f4d6840f0e6e57680797c5529eb060a2785d7655292e0d3e3d436df"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-024949-c6c4b21/marvel-darwin-amd64"
    sha256 "a8a54121606895a77236200d58ca04b3c51dc112c9d826890970520fa01cc080"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-024949-c6c4b21/marvel-linux-arm64"
    sha256 "ab078bb7d486ef62d723acb11fcd9785ca894e224d5b960739267515779b2e75"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261117-024949-c6c4b21/marvel-linux-amd64"
    sha256 "c0dc42c68bb0c3666707b5c3ad86ce147f8aa8f96f8d2b8deb4c939b50badea9"
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
