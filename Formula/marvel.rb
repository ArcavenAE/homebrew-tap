class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.224526.bc5c387"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-224526-bc5c387/marvel-darwin-arm64"
    sha256 "1b35d4c5b768b24f263cfb685d3758cee280269a8429b77720fe73194f56a546"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-224526-bc5c387/marvel-darwin-amd64"
    sha256 "ff8c533903f6351acff043949e545eeffb2e879fcc537e594b9ec91fddb72f6e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-224526-bc5c387/marvel-linux-arm64"
    sha256 "b0127d9ffc4cd93a592a4d48293b7587f9da80034bae99661369d3fb313a42a0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-224526-bc5c387/marvel-linux-amd64"
    sha256 "f8d4f7c98b47e5d5e6735f871dbfe694278a53abc61d90f5c0a268b889102ab5"
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
