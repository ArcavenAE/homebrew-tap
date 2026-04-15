class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260415.211101.9e7ab47"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-211101-9e7ab47/marvel-darwin-arm64"
    sha256 "f36148d3081b1f0693747917676f4be1303cd2e9ea521202dd31dee4f100b94b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-211101-9e7ab47/marvel-darwin-amd64"
    sha256 "a34a3051d257a3dbe46d8b947995746801754e37cdfc64b8a650c15c9a0f045a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260415-211101-9e7ab47/marvel-linux-amd64"
    sha256 "c7a624d5b29751bc465894a2aa748d9a53df23dfb287814d38cecedf5ac294f8"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
