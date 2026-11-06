class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261106.030436.fef4fbd"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-030436-fef4fbd/marvel-darwin-arm64"
    sha256 "f7d055aa7dc06e693aeddc610921e9a2323ed30543fc0b8dd1cb8b56339cc1fd"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-030436-fef4fbd/marvel-darwin-amd64"
    sha256 "fe75e907a04f0e40ef0a8c5b6b043df879d84d3e814129cfad7c63748639c26a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-030436-fef4fbd/marvel-linux-arm64"
    sha256 "5a9486fe7c29d6977d1b089386cffd2e78b04f50c0a15633f35252e389b2fa3f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261106-030436-fef4fbd/marvel-linux-amd64"
    sha256 "12045ebcf223ee75a6045ae101e32fdd95d3d815b9bb51bbc3a4428ffbec5b84"
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
