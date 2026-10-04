class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.094912.d44778f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-094912-d44778f/marvel-darwin-arm64"
    sha256 "dfea0906579f784faa28445c5088629b3d2ffeb2a93c8f98d4f60205ad0d229d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-094912-d44778f/marvel-darwin-amd64"
    sha256 "daa8171cbd16a36dc3ec28858e1d1a9eb4a1707e48d3a11b4e2a024cc7810c32"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-094912-d44778f/marvel-linux-arm64"
    sha256 "fd706f8a44c20033aeeb6abb54bfd6520ad3f4adec39515c9c6fe506183f237e"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-094912-d44778f/marvel-linux-amd64"
    sha256 "6ccd42b8dbe8e3f0932a1745b628c7fcd8dbea3b71fe45802cbe237a77fb565e"
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
