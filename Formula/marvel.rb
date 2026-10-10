class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261010.043449.a35d93d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-043449-a35d93d/marvel-darwin-arm64"
    sha256 "a1249efeb95bcee94dd25dccadf6f0905ae5d2445a121414d951832a58e0b4cb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-043449-a35d93d/marvel-darwin-amd64"
    sha256 "04af8989241a8e876e5afe237a7a44afe010d1eb9c9240887bb3ae0206596186"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-043449-a35d93d/marvel-linux-arm64"
    sha256 "b920bc1f166401fd447dbeb70e63b3b5fd850732481ee742d5e66260e0161c25"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261010-043449-a35d93d/marvel-linux-amd64"
    sha256 "f49658f5d30d6f0dab2c938f4414d72246173f5510ee01a19e5a05a9fe43dac3"
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
