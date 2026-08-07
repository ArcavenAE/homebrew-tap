class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.150709.243d7c4"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150709-243d7c4/marvel-darwin-arm64"
    sha256 "bc8e98eca9bed35fc6b50ebabee6773eab0218c91d2b07f62fe1507eaa2dd69a"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150709-243d7c4/marvel-darwin-amd64"
    sha256 "b8b0d397b94a41a19f34757ca2e3153398c634c46d0dcf3fadee820804ba5e7b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150709-243d7c4/marvel-linux-arm64"
    sha256 "3a6faffceb36dbd25c29e6a572c443e39fcc24d8cba23d7951f5973acaeee674"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-150709-243d7c4/marvel-linux-amd64"
    sha256 "2c6a4e478a27739709ee45ee74aa93b13a139d0d0a01cba0e2f098c7f5e7324e"
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
