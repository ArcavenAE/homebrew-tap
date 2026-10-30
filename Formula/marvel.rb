class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261030.193654.4d74c6f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-193654-4d74c6f/marvel-darwin-arm64"
    sha256 "50d4922a680198349d715620283c60da570be6efd112ea80773ccefdb284624b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-193654-4d74c6f/marvel-darwin-amd64"
    sha256 "21f1964d4552771f96030fadfeb5fd4419bc3ce74d8d3f5b5c0cb1df6e2036d8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-193654-4d74c6f/marvel-linux-arm64"
    sha256 "929435a6d2c52747d18c1f6f3262c5a44718675660419101ad719e715cc268b0"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261030-193654-4d74c6f/marvel-linux-amd64"
    sha256 "361ba39a10b2a96aecad8de4b4a7aafbb7d242e6416ab260aef831e220235efa"
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
