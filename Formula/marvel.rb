class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261112.203100.f660745"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-203100-f660745/marvel-darwin-arm64"
    sha256 "362aed95c67a6373432c77a413c8b2148517d530319813677a14e9388510facf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-203100-f660745/marvel-darwin-amd64"
    sha256 "037a248730d26437afbc23e9783d866b0651f55ec7ae9fe927fe82e076080adf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-203100-f660745/marvel-linux-arm64"
    sha256 "b553f63acc40ede79d69d2e6b15a5f91880e1e84426064a3b0f7ecc789eb85a2"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261112-203100-f660745/marvel-linux-amd64"
    sha256 "5b1dddd8c038e89b76460138e5a2e7644b7b8c16bd97c7dbdf85633e33a33ebc"
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
