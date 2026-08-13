class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260813.092833.d380247"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260813-092833-d380247/marvel-darwin-arm64"
    sha256 "346dd47494623921652238aa5b1bfe2d44e7008dfee6c33cf3aef53911eca0bc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260813-092833-d380247/marvel-darwin-amd64"
    sha256 "7cc34965541d1bbf13e73320d057050fcf2b1b12d5d2171df28811319be73e38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260813-092833-d380247/marvel-linux-arm64"
    sha256 "695cc17b9ee0d4ec14d0bdeffbc58185943999b9ad061f1f45ae9574a02c98bf"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260813-092833-d380247/marvel-linux-amd64"
    sha256 "f460522a3dfd8b84fca0b4f8b67644dcc4e58c53693d919452cb8f0c28a6a16a"
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
